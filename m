Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C932E6D26
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072929; cv=none; b=U09XSpOwkjXdWGZuVfDAuEGXJGxtBWGiepzMm53hWAF+RasQNuVB9TM8qbpbwvyq4YOWxkuB4UrKnphFJvV0Fgfc4/ZjINMXQ8aG+Y86S1fCilldx9pJlfrOYn2up30MxReeFBO5lWrCP26GayINey/tROnFIsj8l+phhpZCDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072929; c=relaxed/simple;
	bh=RBqmm6y91+jO6MdXINPCWCg3viAFwnMdKUq3SgXL3z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNzcEk3TQC+Oob58iLZQ/ubavWgUzyJjCczAepAfeLzC3QP3ps4ZmHp6J/zhfKHJlmUiP4rQhk1wSNE23c+wsvntcnaEcAikMxUgltezLseCgwbMVmyIrCOeQI4aqKx5sI7JV51YcvHhFStwbHRAf9iCJ/freHbR+Rfug4Nze0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=o4+qvPsY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="o4+qvPsY"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso7408466b.0
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752072926; x=1752677726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN/6WRtWv+PbFm6J3y+B0W74bkmxsW5QkrIaTbqFnB0=;
        b=o4+qvPsYfRKiUoqwQMhbRKBKXtpc9sslGmFMAlEvjAjAtQ1Qh7EJZ35fx2bKlvcQs9
         EXNhYt/6RsDTy/gzMHzUnLgexHGGWTM8Uc10u0S8Eyhq26b6y5eisZa4t8n+gN1GcOvM
         eJwrSD2n4uC062WtV1v7vsK9fontsS0nlc0WIjc4ibUwq1gwzSMfthuHxybceq4GKB95
         3HP4bsC5lIkaxQ4RTwuM/pkyCU0kvwQf7rw1Q3ARl2uruQgHb4do/vPTkxrq13/aDiiY
         iI1bmPsIbZ7JWs2XXNBV2ESSgiGVOHq9wxpQAlliwCRH3s7Y5u1YjNaGgAV5QDXCx20M
         fUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752072926; x=1752677726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NN/6WRtWv+PbFm6J3y+B0W74bkmxsW5QkrIaTbqFnB0=;
        b=pPcA6d+ogRIYimfh216W4Hp3vB0TULSo9tHHUHpfWqFlS3/OKt8VLMahK9up2wfTIM
         fQqrci/ZK6l+2hlCKcegv4LyaII3fSEdPB7hF8e1HUXKt2ptCLUAX7NgyDFOCIiJskUf
         cONvPefxf54GWyMtHbvCH5nLpXqKzCgAqlSxLawh1xRp+G3URagR4ds/+0wkF2K5npAh
         z6cQNseJBBw5Dmm7FME5jYA1UVxrJoc/ZWYSKwchNMqxl2NI0XjAKxd2m+FB4Uec/ohY
         8jODHHsHfRYDvaiaj3ykwVnnbFsnYSV/b4ZQ+gFxKEUNrfHPHr2YyFzY55jptmDPsgqM
         /3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXqjcIMSsFhYne4Eu8ogZ+25pbXyG9HGuNZPmt9egJrf1Fb83hcc0dh1yaCyfwe3QLBaIRyFCaA8CCo/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8YY/xKDJZESAxVTAORWvXKUyMW4Kb2u9xbkJrAoXQQk21Xx4
	vDAw6VkICC74sGDbisRbg4btuA1ggJ4COdZN1IBSYSFahcRsRvNzS1rfwEP8CfY+4mU=
X-Gm-Gg: ASbGncvd0U0KtQCDwYDD+PzraGwdSmT0vf7jjV8Bbw4rrtrUIh5lDtg+V2VHKnDxZx3
	CXAqzJSXlGx9Cchfrb6Rh74Hshswd410RnRarVUCJymSSGmWgjboI0iSEkbL8v7MlzKE5GJ5jIP
	pTXRTEfFq/I+t8Q26UvVls7CC5JhxVYNEiqHqAibxKKAlK+u5Q2gk5j7OeoVPGzHSpfzOnlFu03
	zyQz4KxUfJXOQExEn/LFDvbW2URj3HMGN4TPY1D6CCZ1GcP/VAkPNyaR7qXu59MR16jkR2Phkop
	8k4AycHoPKIHHqFXUvlHT35lwZluNk6uUokapIiyTzoxzLsX4eVHzpF0yA7zWHY0epmB/IGBYzm
	ga8YiNczLiwFsslPWEJU5Dn3TIQGwpZbU
X-Google-Smtp-Source: AGHT+IF2i3QqxTWjuz5P1YW6xQ4cfF5i5ZqOygwIXICALdfEZ1j4uTvDCh18CLGk4T33wWsNXDP94Q==
X-Received: by 2002:a17:907:bd96:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae6d146ee2fmr277785366b.24.1752072926007;
        Wed, 09 Jul 2025 07:55:26 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b600ddsm1116795766b.158.2025.07.09.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:55:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 16:55:16 +0200
Subject: [PATCH v2 3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 compatible for PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-eusb-repeater-v2-3-b6eff075c097@fairphone.com>
References: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
In-Reply-To: <20250709-sm7635-eusb-repeater-v2-0-b6eff075c097@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072923; l=956;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RBqmm6y91+jO6MdXINPCWCg3viAFwnMdKUq3SgXL3z0=;
 b=hwGOCiTQWIof7HrmAiBGw2P9RUOR2R7YKLzD2dtTwUYTAmNlWb35hTXpZMFEfFaYmjFiUHBqy
 d2B4j4RXkNvDSM+jA2uL6VWuTxh1n7b9WZPphpHedP0CWDus6dVYyYm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dt-bindings compatible string for the Qualcomm's PMIV0104 PMIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 6bfd11657e2992735998063b3ca390e04a03930d..5bf0d6c9c0256300d00f84307b7f6ccf669f17c4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,pm8550b-eusb2-repeater
       - enum:
           - qcom,pm8550b-eusb2-repeater
+          - qcom,pmiv0104-eusb2-repeater
           - qcom,smb2360-eusb2-repeater
 
   reg:

-- 
2.50.0

