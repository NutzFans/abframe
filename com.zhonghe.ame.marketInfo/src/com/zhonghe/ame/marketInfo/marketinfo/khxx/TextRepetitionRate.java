package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import java.util.HashMap;
import java.util.Map;

/**
 * 文本重复率工具
 */
public class TextRepetitionRate {

	public static double repetitionRate(String s1, String s2) {
		return (levenshteinSimilarity(s1, s2) + cosineSimilarity(s1, s2)) / 2;
	}

	/**
	 * 编辑距离算法（Levenshtein 距离）
	 */
	private static int levenshteinDistance(String s1, String s2) {
		int m = s1.length();
		int n = s2.length();

		// 如果其中一个字符串为空，距离为另一个字符串的长度
		if (m == 0) {
			return n;
		}
		if (n == 0) {
			return m;
		}

		int[][] dp = new int[m + 1][n + 1];

		// 初始化第一列
		for (int i = 0; i <= m; i++) {
			dp[i][0] = i;
		}

		// 初始化第一行
		for (int j = 0; j <= n; j++) {
			dp[0][j] = j;
		}

		// 填充dp数组
		for (int i = 1; i <= m; i++) {
			for (int j = 1; j <= n; j++) {
				int cost = (s1.charAt(i - 1) == s2.charAt(j - 1)) ? 0 : 1;
				dp[i][j] = Math.min(Math.min(dp[i - 1][j] + 1, // 删除操作
						dp[i][j - 1] + 1), // 插入操作
						dp[i - 1][j - 1] + cost // 替换操作
				);
			}
		}

		return dp[m][n];
	}

	// 将编辑距离转换为相似度百分比
	private static double levenshteinSimilarity(String s1, String s2) {
		int distance = levenshteinDistance(s1, s2);
		double maxLength = Math.max(s1.length(), s2.length());
		return (maxLength - distance) / maxLength;
	}

	// 计算余弦相似度
	private static double cosineSimilarity(String s1, String s2) {
		// 分词并生成词频向量
		Map<String, Integer> vector1 = getTermFrequency(s1);
		Map<String, Integer> vector2 = getTermFrequency(s2);

		// 计算余弦相似度
		double dotProduct = 0.0;
		double normA = 0.0;
		double normB = 0.0;

		// 计算点积
		for (String term : vector1.keySet()) {
			if (vector2.containsKey(term)) {
				dotProduct += vector1.get(term) * vector2.get(term);
			}
		}

		// 计算向量A的范数
		for (int value : vector1.values()) {
			normA += Math.pow(value, 2);
		}
		normA = Math.sqrt(normA);

		// 计算向量B的范数
		for (int value : vector2.values()) {
			normB += Math.pow(value, 2);
		}
		normB = Math.sqrt(normB);

		// 避免除零错误
		if (normA == 0 || normB == 0) {
			return 0.0;
		}

		return dotProduct / (normA * normB);
	}

	// 生成词频向量（简单按字符分割）
	private static Map<String, Integer> getTermFrequency(String text) {
		Map<String, Integer> tf = new HashMap<>();
		for (char c : text.toCharArray()) {
			String term = String.valueOf(c);
			tf.put(term, tf.getOrDefault(term, 0) + 1);
		}
		return tf;
	}

}
