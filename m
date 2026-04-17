Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7314C33AD9B
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 07:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409677; cv=none; b=cTN2iv7hP/kho/PWbpFIydIivjQ4tdds1bRuitl8GNMc6AUhcI31nfBhNg1uyodToF8otnwjE7RLoD7NkzMHFOrVdWGaYR5hZ5jycvWLdKzGxiClkDicHvjDLx81HRx7QZpsdQce3vACs0ueltWfWwxFi9uqNTJtEqPRYwBaxMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409677; c=relaxed/simple;
	bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QgHhBfnVkutA9wLMGFAhSYyR74xeM4+V69BGoAbIjWdjqb5qFpAG+SEgev/8GVz9ghH4L88BZnOViYk2Upx84bR1UDaSZISZGFmB/CVDGkbSmd4RwgRNYBQrVoVcxyIST1Ps+qG0wvieOdOr10n1ou/zTx/ML8BPXnCxoY0r6Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KI0gSCtr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KI0gSCtr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66e8cf72a93so438514a12.0
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 00:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409674; x=1777014474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=KI0gSCtr1Vqld7CvrdNWBKb6UUd+HiAFPp4Id5DFUBk7QOcmTvJDgbidO7AKF8vu7B
         w9tx1ezniuwjYlGUcChECpk9VvGmHokLHnKNamSFthjuyyOLO3sDIzZbZwkkBA0oCEK5
         xtW6pP74QqeBjYgbhXKczwBEnP4E4QV+T3+GiBD6oGTukDSoISJs9t4vFDxsrEp+JH01
         U4T8eedDbPSZ+dbVLFeJK9M0wgTail30zkreQUW3G01EbqWi9CXtZrR6LqDRnNJC0ZM/
         01IvuDRcxsrjCtzleWwT2+1x0+d1Q4Kam1me3yqcymF2TzmqEMnHdxjgpxAd1Dhlawi+
         glvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409674; x=1777014474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=hiPTzj6wmtXr7qVrkv9DJWU51+pH6PdVagfu2VhMGIPqNO/viCP7GHVFEgl1Zoar8V
         4SuzpIZrtiMe1Wxf37oflQ2KIoD9LoYc/MzYVO5ip/uIQaaXvcfXfCn4E4N5dDHoy1Rn
         JTAyPGZrnCJM24z0n3tRtbmxUDUpOp8aLNy757N9UzPyI0wTy9MgFve1uSbCyzFKCyZj
         m9aEtvWVLx5VJ9tmmdkaZpLaEMVftLJ1sXvzrJn26W02P2exaomeG3Eu4NqJ1UPmDAot
         gnG+c6KZMomapL1OUSXKvuUIG+idOJor8G0E1VmUVlxYxlrSo9CY0FP6s4IKWeiE7ujp
         YtbA==
X-Forwarded-Encrypted: i=1; AFNElJ9svogEbj4IWMi2WSQ4mlXxqH72CoTV1Zx6ZHNaZK4ByjRyQ/dle2Ah5AlUiuuGShfxLQLLd1P49Wmn+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAC+jvsN1gUfN+CBzsDeAjDAwI8OQpVgh/f695wh6W8pnb0IKy
	9wYyJVRJenZziYFrkY7/A5affqA/REAB9SwuzVepGr/a6QtMP8x+7q2UzpWzNZt14hQ=
X-Gm-Gg: AeBDieuvU6/FihzfWsoLQfYZ7M5DiuVq0TKYE8BPvh1pgLalKSrvtIklycolKMcaD64
	pkBANj7Riw3C9T1+kxUBHz/lMYnVg/ED5gpo3ijlDzSJYgx4JMyCydEcIvhmp89QUBRVXZxyCw/
	1ldEqSUE+GU3iRJF8CtI0OGiv/6JYk+4tJvv9gQsSAoNJYtqYNjM00auhoC7XFjZ62fG2p8VQSe
	+Insi9RkrXaM0AJ3GEFIRe2oZ6UTbebxu3ILI5pmgDYJ7GHZkiuqwnTr5QMcdDFpCBwcjD+1GhC
	G3glqZYQWEdUT/HL0uhMZ0VUF+BxQC64jFyUaawFet303xR2yAb6Kca8HSlykuP2dlSKYTM8VGF
	cy+EzOmvCEfnRs6SbmU+xtipWYbRn6GV2+tVGjKaCeFhBXbqYSBsSESesz4MLa6d1eiyJ3ZY0iB
	JF2iGZubQjIadTfPglyfgRppufC6I9bo08kraNY/EYP3FwTgbHErF9nl9wn0BSJD/fmuN/L8yGG
	wQvdk8EK1Kg+fZO
X-Received: by 2002:a17:906:dc89:b0:b98:6926:13cb with SMTP id a640c23a62f3a-ba418b7e13cmr85858466b.9.1776409673778;
        Fri, 17 Apr 2026 00:07:53 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:46 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-3-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=1066;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
 b=8898ctpJBm3z6J1Uj5QTf6yngGfQCbUWxKiZsXVNy4Ta5P8d/CK0C0G4aB6tnCpRQPEcfJeNB
 L8jWLKqiTU4Av8SW1RkWv8ZYRUHrsnE6+elqbkdzzz/fze4rBXJsT2v
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the GX clock controller, which provides a power domain to
consumers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..4bd9181ca03e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1542,6 +1542,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0

