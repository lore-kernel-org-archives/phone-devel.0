Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E924C095
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582039; cv=none; b=MZQyWMekfKs5F1QPcixECeN82scgertEXGEmynDEn+jEaxRGfyaodXbEJujtlyYXajmXpN5nMfjZRTmD6mj0aSq/PgXr+u3aMWcqQwDILeaMxGqZdMmcgKuIkGcHZ+MJh3WFnp7k4ckt2eDiS9YRMwa/FUf/kYi+zZwfkfGpYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582039; c=relaxed/simple;
	bh=1eEHp7uYWZhKEK9Ng0jAlZtb/iv/YO+ZJkAaGAMQmPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW/ahhkIB3HRp3xcCpGybQkRQCIe5ZNxnPBvoZZubNv4mIv/VfzKjUixyASaBb2Ftd7r36On3rFO4TbPJaRNL72PoM2Fs/9dnwpVRr32qtQl8mIv3n1vN2dg1Wwv7RIBakqILIS7CosyK/K9j5er307vYmrXwx/t8YpTr94fEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DY+EuAHz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DY+EuAHz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb2faa9f55so271089266b.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582036; x=1746186836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfKL7p32J3lTL5hY/U8dlghW4gxQZ8SlxPE/GiXifaw=;
        b=DY+EuAHzYkr++SoajSKcu6/trBKUzkiCLvfy5NfAfoDB5C7spdUcl/CgBVALmjyEw8
         /iYS9e192ox4QRjjNlHXHLW1tEbLoGv6N/C30s25gp2UxinbQAlMpvW9tEvcgr/L7AmO
         w2rgniQ7FitwEpz/ve7eEClzIwH7fl8I44lzXbVs7qM3aGpKmvF5rfxSxbKx4EGy4D5d
         6y4hA7znLkV6JnWxqkux3rOp2Bh0JMWsps1Dgbh4nYDPoonZmAK7hXty0PTSOad+/28W
         ydItBQFPZ2PZDeriN/11yPhJEcwtFIRoLl+MQigK+2eyF9piq7xoZLRd+a80FdyyvuaY
         qpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582036; x=1746186836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfKL7p32J3lTL5hY/U8dlghW4gxQZ8SlxPE/GiXifaw=;
        b=MSLXe1rJtASa3UFnAefbCeJx5A8OqDhzfJg1WDgrfnBefKTrHld9WXyM5BbcHqI2GD
         CUnNeFHSMjIfrIbBindV1TZXeA/Yo+wZS4WRLhCWeb3EYAFq/t7Rd3m8KJ5QnkbXebsZ
         ucYQdMetoPR9OjOfMFj68OiC3+AjJxPU3YLtV5vsNfMon6XbdD7BoSyhZV3dIdBEkqpW
         hxwbrPxvrEW67IyQqc69cmS8szUz2hFy+ciihBOfHkUzsS8dudNo97Aya4CUwbsZuzoD
         xtXTueJs6TfhXggCvN3JIgWIgwgwqBsq+cv/CAseDa8+1ncW7F8dGOaxJlR2mno+5hpW
         NHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw72CfWVAJbCs0KYOgKjTYDwNekUgtWTZn30UpBKcl8nMKbX2lLNkRUzz3gFSp5inmSda3L9Tl/Z6+7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2W5GfjgCPjaDHT01ppJuY7zilE5L4FMH+jMEdB0pfcarujtaY
	E49MECwFC838JPlumMQs87PN3V0z476LEs5xZhs2pr3Qdckn8mO6xcszB8mLbqQ=
X-Gm-Gg: ASbGncsfbDoGzD81SvbnodyA2sgZ6xMFPE+3M4CkShiaMAOrnZ8n3gfmSJMX2See+/n
	EheFZvpxYjWATyMxUjyj8FUp6kO+HGmkcdlK2FYJqdugbxYpmSoJxw6XywEb7UEL6+5CbYNX1/5
	XZdGdaqFJKSPgXjKOOKvYzOCC+Ydsi4YIA1RYI6J0S8ETpZJfa+GvErR2Zpdn4DNFeLOpeEs2uw
	dz+he+zYMedky0ucDIaUo+/T3Ed7wM0I/QuRz8r7fPpFPGfVahZjWnb/QGN+aBcmeRG+rIhVlZE
	vqDmZZ2wc4kd8B6XapJ2IVykvbshAKh5DAoYC7A45hMYyJxURUgBURW5sW8g/cSTl3zknOwWtnf
	8fOEnaG1VinORN1FYi8pcPnj4EDfw0i4JQPPAInQK/hSDnoo8oiKirHhK
X-Google-Smtp-Source: AGHT+IHEGtbYJkc/X6zmKZJpTYKg5SbhwKo367p0skHEsiPnLEarB+Zfnb6B80n1IamI/iDdFNeaIg==
X-Received: by 2002:a17:907:86a7:b0:ac7:7e3e:6d3c with SMTP id a640c23a62f3a-ace71425b3dmr210633566b.55.1745582035730;
        Fri, 25 Apr 2025 04:53:55 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:43 +0200
Subject: [PATCH 04/11] arm64: dts: qcom: msm8996*: Use q6asm defines for
 reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-4-28308e2ce7d4@fairphone.com>
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
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 38035e0db80be9c4829b67233ba5c4ce8a2baa21..3897a177f12e98b77d8d57633783ba951f3da083 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -288,15 +288,15 @@ &q6asmdai {
 	#size-cells = <0>;
 
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
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index d7fa56808747ae1290b884430d5fa5443bdd9be1..bd3f39e1b98fb6360950b646fd05c6b7036dd0d5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -137,15 +137,15 @@ &mss_pil {
 
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
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index 5e3fd1637f449675411b556b9cace21383b1935d..443599a5a5dd573a1ac2a83f64c5016c36d27020 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -87,15 +87,15 @@ &pmi8994_wled {
 
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
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 5e3b9130e9c2c9e58c334e5ff2a340b82bbfbcfe..33d84ac541e1c52028ffa4d86d602e0dc876988f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -139,15 +139,15 @@ led@6 {
 
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

