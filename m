Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509A2566EC
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582044; cv=none; b=gkiTq/Pbb9ZEcR6y46LScfqbevtv4L2SNztUaLCXJ/p2Wscpil4gAaNC+P/yzri4NOnTi7qGihVsms9ZmzLmkno4lrg1hoPW5zek6pfry+K5ioN5nVtzqWjM4BG9PD5h9TPvJN6THVTwNy6sa9kmSxTS6l/OMZY7O25E8mscYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582044; c=relaxed/simple;
	bh=GWQqKqhR9R+AOl4YVrKqeXpFyCgWMIrLiGYVX0UFDvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUzaoPO7/iWdKIR7fHr0rWWEzbTwB6/wr/qyCY4PQGAepo2wmR+GLgG2pdqGiFSD0YK5USD5uUGpa48MyA+cPS1mnIYlQLhUTUtOGB0oceHsy3hhYh1Is6f621Cf2hTxCBzWNAbusLFftLzw29cG4dNtOOqeUybt4voILLHn6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ctLEYos1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ctLEYos1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso364605966b.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582041; x=1746186841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDdEuB5Uf2ftGqBR1zZgMGIrqfvZkuIBMu2lF7TePII=;
        b=ctLEYos1sTpiIbQM6kORCja2NAExUxH7/ZWqu5Kiep//S0Vmz1hu08U7qHvsgdPzHb
         WYapIJ2qqSLXXz2ri13Cg6Z8UTw/ZnxWKXRsX8uuSj6oOYFv8ED4OOWratc5z8jCRjT8
         DFH2VtJiSghWeONESHnnbgBqW741mAKV6TGZwxhiBpRI7o7rNhSPxOfP3I2iJFxtDJkq
         f34iZMdjIE4az0gTn5TLW8eNtqKyd9To9lgmGtnn+kSgCDgSDbumaLzlnRNh5Bmt2His
         VLgVlIGRNok/jImQoHoW/fNARKR3QjIcIHU0BNL8hBeKP5r4XyUmrLWP5wh21rV263gF
         m/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582041; x=1746186841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDdEuB5Uf2ftGqBR1zZgMGIrqfvZkuIBMu2lF7TePII=;
        b=FidlCNGXTa45SLkOX8/PV389ktmR+uzuFy6R42WJP2N4z1N1gd3qhUIgWGbDB69WTN
         xh/Duf0Efn/OWcBHBLO/2LIIlkRpDhKlsKtt4uoEhRPKqX8CA8MkwqKBke/yGKaUUgdK
         FnC/qqAruNp37X38amPriZjO9BNZ9D07H4Jytd+dCNp7WM/0pjiD5Jq4z1w2ccmZFEwd
         /XlC/RFORSuwvhBxd0yd30eBH6GhL3vcUw/pNFstzzLXCRUD+YjJhRVvzXe+Ms72rgUv
         KXQgBOCKSCi2a+RqboXsWXHiAtmoAO9FkOPtkumZbLkCkDTURgtqz7UMlQJj7HexsMZq
         Hf2A==
X-Forwarded-Encrypted: i=1; AJvYcCX493wck7cvy3mJ9TXyfZ77tqa2pG66Ksi/JG/hK/JLkeg7ArjB030zmuF588tOHpt54fdyrS08gqBVGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqaoIywigYpsivqg+tu4ABB7KwXxc6kg+ykByTUwvNz/aa42aV
	HWcIIyIGGSTsDfTmxvTwNjZHzCg570bZoXOlEMpclMs8rRRG/2BQSbD5+koojgc=
X-Gm-Gg: ASbGncu2No/r2zFCmgVl1vM3VDNtusR7qeEdfUfp/g6h8add21n4sp2Vkn6d3ASfKcu
	5VM2bMQdFC9Z4SScEFmHd/7ih8MVzKUUhl33PsGSQ40+OmsD6mNfzTrLWQ1UPNnjVHkPqtlMB1I
	86q4GF92/cG1I1B+EEAL5CMNKT84A72Z6bgC5bH5/cs1pBdLliYfv3lAR0YEWZoV/q84WAWFfRK
	ayqbl6+JyHCpB6z50Bw4d5IphhhXuaBQRxvxBR797Z7Hc4hGSIiJmv1UgKxBF1ViymigZZ2cIuo
	FE6d7hvWPIQ2sA5bQsMx9A8QEkazQhQ+3K4nZwAbqvA6+jXgEzDGSVaDqaEGMEtDBzP71OF/9gk
	kOUQ88S6vduIyWRR1Oyl5O8SIM0ZZUx6Qw6I+4+1kv/G0Xj8xVkCLw9Vw
X-Google-Smtp-Source: AGHT+IG4Z132zO4DlBBlTSecMUKdMkW4PCG2puRXamZip8fJXNOQgwUPsWLBjFF15YC/bWh/tZwUrQ==
X-Received: by 2002:a17:907:c10:b0:acb:5f17:623d with SMTP id a640c23a62f3a-ace711177bbmr168306766b.24.1745582040456;
        Fri, 25 Apr 2025 04:54:00 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:47 +0200
Subject: [PATCH 08/11] arm64: dts: qcom: sdm845*: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-8-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 12 ++++++------
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  6 +++---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index adfd916270055df0a957c573868302e0d77c614d..b5c63fa0365d28fdc4a61dfe67ab6a184e748473 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -714,19 +714,19 @@ dai@22 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 		direction = <2>;
 		is-compress-dai;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8a0f154bffc3d55ae2134ef28cb7653dde702552..b118d666e535a433f44b66c71b36e55df2ce5c80 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -517,27 +517,27 @@ dai@23 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 
 	dai@3 {
-		reg = <3>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 	};
 
 	dai@4 {
-		reg = <4>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA5>;
 	};
 
 	dai@5 {
-		reg = <5>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA6>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index f790eb73abdd4c850fa0fe6f8f332e57c4cb9386..341b9d345f049570a48f2a4473a3178646a57eae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -388,15 +388,15 @@ dai@22 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 501575c9beda966dea233079847ae375b41a2d18..63cf879a7a297e161c57ba5256d52c9d6cfe9767 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -543,15 +543,15 @@ dai@22 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0

