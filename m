Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA916494A1A
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002006; cv=none; b=JQSGjXFczQoBcvLQUrTNPJXcKLtjklIMHe4lhV/EBuI+9RN8OORc2uGLSj1wX6yWsgF7rZPy75vV1vvvpuFs9ELM3PELEEe6puqGcdFpdnA1SJxo+3Es9wkdXZSrCS1uptQ9UyU/Zg2An7FbHksG51ge530wwwJdNYGrjZsZtG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002006; c=relaxed/simple;
	bh=bOS34N3APqGI6AgUcL30CVUFlmgWDAw1B3mfScCEFCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdZDNAyC5yuxmiDUNHU0Vz8maHG+UgbXP+lP8aGhz588xZUxnVUOnWU/IbY+hf2vKQ6YIS4Thidfw0psbZ3A+0IAWY+myXNtJrpOWnL3RY5t9duU3082vtRMcLukPgx0Ekw3xYdJkbB9zJFTysVZ+pmlZsaTcRo3jfiFm1tJjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhc6knRM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhc6knRM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09757004cso58455395ad.3
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 05:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002004; x=1769606804; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wsNHq0zgqFRtWN3Q3r2Wx4pD8bNO8exoPE+MC/eMk8=;
        b=Qhc6knRM+5lcyB4yk2sHeDTkITehR4e1Q09x5alijN2pqsrrxWrDG9a6QNP48wL/vr
         qqY6L9Fh0RnDuOTkmcCHf4GYPDD5Rp2g1yjQTMJDgPtqwfw9GGFOII5UcYXgVjMOAmqc
         couxCkC4VZJI7OmWVgqak8CWeSZkkPS+/XyFvH0xRcD9czEacDyyzyysMVjgRgru708/
         ZYU8myMZ3VzPR3AIQ6usYJXRaeAyI/zF/SNrWTIb616q67ClC+gnp7bdOM6bO/SrwMVs
         SWppIbSLqjkgiTyDjQya+fGCGUcbBvgH1912pQrS2dA0AIkPiEKM23Ddry+wX9QVuGoR
         iaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002004; x=1769606804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+wsNHq0zgqFRtWN3Q3r2Wx4pD8bNO8exoPE+MC/eMk8=;
        b=TXXU9xFY+SJ9mLlFInXD7HNX/JdKZNkshBGEXKaJO7x+vVH/LpTzd81JXlmWl/ysRc
         wFlt0FGH12Mq6KkWrEJZXCeQAR1ZRoY1cNdQ0dKj7A7ngsJaTjsxeL50EwRNf/BYg1WS
         n8CanzhtsJkmkmlufkXgi0eVvhnOWEVlUOh5cVqTHIFvIvKUpq2Q5JNQ2y6hL1afIaXU
         bpfiiIO2mGb1kyfQYmjEjuYMtueNH0ilZ9os0GWup675wJh5A7BDFzEv/i2CXpZYMUtl
         2rBMa0v3kcpUMscqSio5cLLmCw4hkCFmmznAj1H7lBlbcXuzNfKHlIdITsk2Tb8Clv/O
         P00g==
X-Forwarded-Encrypted: i=1; AJvYcCXcFw6HD+Jk0jh2VpbduWJpjOhmQHdSFPIQNGGmyuM8vW3ySEH4GF2Vfs6ERwS00C7s36rN9qGAJ5TFXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGgOctwzF+FTE5LRh71RbZ2oQ7rLReHXqdlRADXZRl8MtF/0J
	/vHSljKzRUrTD7OBktza7HhKyD3qNT0y+4mUNs66E/UUqIOVtzHcEk4l
X-Gm-Gg: AZuq6aLC56TC84GkP1BF3jUttT4jC0HhsXv8ESYu03e7nh/QwdY+QjCkr5GPWPMKFBB
	x4dvlEF68PjA8fm49Cki6qrdCuZesk4rcxmBA7+gLwDacYde7vJStL82CCeOnW7bd25xH0WqqD8
	X9ojf/xZ2PDDyYnlaDyKfbJdFEkl2zDy/xmYRbZHJKhVC6njdJA6i4il4qGzLaXrLKgLUriiul9
	SL2z2Ia/0rXD0T7c2aTfIXsVEFyNjW1kIe1INH2SuoAiBP0MCxR+h4TuphXBCSLah1wi4Ou6Fgz
	Ld2LZDnDJhU9NOooghURenXTKqVzW+O/iQik1J8NMExSJLreXCmomwIJ2BVWlOCdAgSdSFKOLbO
	YQi+BNVJ9eOvA0oDJUhhtnif7OWWw3bIyZ2tJ1XG6eFOCJLLy/96MsQqSmbeDtRpOo7nuRMdWiW
	VmaLmM8gJ57CNCQwAI
X-Received: by 2002:a17:903:3bc3:b0:2a7:c6c8:2cf with SMTP id d9443c01a7336-2a7c6c80a68mr1676125ad.22.1769002004091;
        Wed, 21 Jan 2026 05:26:44 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:43 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:20 +0000
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 debug UART
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-4-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1207;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=bOS34N3APqGI6AgUcL30CVUFlmgWDAw1B3mfScCEFCA=;
 b=Vz2aLtL2O6Wg2x21r38IOz/UfkPhbB7fhWqA+y0R2ZrPCl2JjKXvIuwzILAvT611RVq06r19a
 AT0x+YL7ICYCaN/+mplt04kozP9nqYIZRzFNkhzPD1C4UzCqo2Saavf
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Enable the debug uart node in xiaomi ginkgo exposed as test points.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 6e0333378..9a5918abc 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -26,6 +26,10 @@ / {
 
 	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
 
+	aliases {
+		serial0 = &uart4;
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -120,6 +124,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -296,6 +304,10 @@ &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };
 
+&uart4 {
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };

-- 
2.52.0

