Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C63A9601
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805701; cv=none; b=mh7gpfrORpXP4USdolxR3AMLPL2tkKGOTYhLlz+Jya3SDOtjcIMV5O8wyIaDBvJVLjgwP8G8heV2k2iIkktzU9vXfRV+44J8CWcFOETnmduiFt7205HwP9zGDiP28tbpcqZfnOT7roeOo7s3Rj6ohPn8mSZ+x433ciPfJAfe7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805701; c=relaxed/simple;
	bh=wkBia88uzJMGxqRD6S3lsbMjeBW6LiNh1cpModx72H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vp3d9VMSy2wTT8tMJsx93mYVKUEB7EfOG2aiBtcw4CSdc+VGDMLhv1MqrC1bCV2xCcAmtGXnv+qzmI2Im0gJRO9TqcDI1jX2QnifCIgI0Ymg6y/5XT3e1/BTgEzyxzIwB1H/YeA0Y3d1uI4gKHxAR/3fi29eLvYYGK7LyZuQB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3jass/54; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3jass/54"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so3146818f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772805690; x=1773410490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCjpNt6dWkJQCAOzL3i/TG9URIgkeT7ZM1PwnUPeAYg=;
        b=3jass/54aoPksJpnbGLfLY6ttoD1Zpx3BHtjzdQJyCJm1jLjc40eJP84wlrfLOf9ux
         LQMxpFUsWPpJSjiC85b74awObqplD0VWZhQVirFFhlUQoR94faghRQMn5Vc0DOO8S7RZ
         lk3TerFSKTeN8O4zYeciSLQJZq6xqHeC1PxuUl98X30iAThX0HQEKojAoft+e0HgS/cl
         ejOfn8F8y30FWBSEPiS9Yl2VsMuh1Jz3QFBWQqMi9TVR08DDtRvJh2CCBCZo4HLtKZIN
         T1updq20ftXssojIG8f5LBbRjcUx1LzTaQj+C+BDrk7e8UB5ESJjm+HOW/nPn7QH6z7Z
         NQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805690; x=1773410490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCjpNt6dWkJQCAOzL3i/TG9URIgkeT7ZM1PwnUPeAYg=;
        b=KC/vtx0m5qv6r6/tZHcfksosOIyA0l+kWZ2DlDTZLN0j4UvEw9FWS27gnxHd6F3YFH
         yKU+SR0uWk0P6zDDbvSjdLyLLz/mAgAYj/FdzKXPVVJ/SPbLjiEICFk0vN8TwKJbHA2Z
         ZEuk4/N9su+Y+p8ThyIEZARxtY+V6kFvXLmt2vJZq0xsHVGThqFjnd39H6Xr/dnaUSgC
         TYHCdG/yMsojI12SCny+OvTJFyGvN9qufaWXS1Gt8zHsD/iSbzzuRkfnlV85khV79aUO
         Rrasw17qo+LzOzdFcStAGq5W31Ud6GX6ozFt0q7fmk1Nzdk2/Ddvdotnaw1/4a0HlJfj
         Yu4g==
X-Forwarded-Encrypted: i=1; AJvYcCWv2gaxk6QH7i+TEBAldwgC+sBd8UIPbpQyv/7V/hHddsC1qSA0kCfRMeeIt83YKz1ochQaj8v7xmAEAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYR8seJq2kDzPPrC5JtXe6vbHFWbu41Uq5urimoUdrRjsxn3E
	x6LmmWZAtLVVy8Iuxst/OgU1ZzCoOCmSucC0Jh+vjkC88nl9ticBWWOJ7w9Cj2bhudlEQs0e/l9
	oNZWd
X-Gm-Gg: ATEYQzymCMFJu9b+/l9rBOvFbYI8F79dgFVAbMwMzRIuBN/dAmIozJuMnyALl0LyQ7V
	H19Yd32Hffwaagn04c9dYtbhllNg4T0dUMwf+xazQ0MHaQavOOOY4C6PSMs1WEOUlgX71PUpAWx
	LTB5Udn0f7JhUywD0GQFyxHakN7TXLq3aDTrdGhVGQC1OoYyUFjdrYSqSa40BQ4MTW2pXRBozby
	sIRVcKP09+jLYtEJi+j1ZjdT7ILhtYZA6Mgyh/5J64HfXwht4pYtz0+OkEoOnDfEksHjeFFbv6d
	2gey6+wp3yoK1jps29ZOOKRHI7gzeL05SLt1sltaJIOTQogomY/FPG2JufarSMn5rXvbBthyC5o
	8XoQdhFRKV3XJ8eCSD2eJu/V7G3SqqPja1VEEcJP4iYg5FROGAAM9KyWHki1OrT5x2tTEH/Cf7U
	b+JDis+MmvqO00GEx3Ytyr2f6KGJtgp2iii+YibfiLMp3Q9f1kEdeOoS99evG8var2QxQo6bXYT
	11J
X-Received: by 2002:a05:6000:400f:b0:439:b374:c6d8 with SMTP id ffacd0b85a97d-439da89bbdcmr3621790f8f.46.1772805685236;
        Fri, 06 Mar 2026 06:01:25 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm4313828f8f.11.2026.03.06.06.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:01:24 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:01:19 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: milos: Add fastrpc nodes
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772805682; l=4212;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wkBia88uzJMGxqRD6S3lsbMjeBW6LiNh1cpModx72H8=;
 b=NGipAl+gIt6Q9KQUFZ1cGi4ANI7T7hMgguIpm8JNWRYfC/gARnHOgFgUgmwep/FbNtS6jxYsq
 /NvLG2HgSKUCTTED5we7gq5h53zjFNyj8tC0ny+3+LWA3IWMU3P6UfZ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add fastrpc nodes for both ADSP and CDSP.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 144 ++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..83a454ae9bf8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1214,6 +1214,55 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1003 0x0>,
+							 <&apps_smmu 0x1063 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x0>,
+							 <&apps_smmu 0x1064 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x0>,
+							 <&apps_smmu 0x1065 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1006 0x0>,
+							 <&apps_smmu 0x1066 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1007 0x0>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -2164,6 +2213,101 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@15 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <15>;
+						iommus = <&apps_smmu 0x0c0f 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};

-- 
2.53.0

