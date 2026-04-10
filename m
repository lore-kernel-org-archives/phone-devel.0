Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44523AC0EA
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809035; cv=none; b=jCaAp+U/AbOyk28WQlkhQvJysC3hwpWYObEEgXPnv9xVI6Zp21WjVWz1wNeVyo1tT3PByraskT4FS0TkCF/oQfh0OlAUYXmCKqYlOtW8xKBl0/AGJswASJ9ZKrFEncjb3UNT7qn1Zm/ADSQpF0xt6BC3I3XNoI/DKy5tAuHwPjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809035; c=relaxed/simple;
	bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWhgIR9aPf51GiJuo3wqjM09cDdd6U4/9NWPsLX/QIk4JBRlE1egQzTWVWukD5Libt2RnJIUGExjYnbzKnk3R4VupqdUz2libpEYxFodpuCIUWMRKM30ktX3xJbqIpnDH+UTsWYxjYLCiaBe1S66fV7AdGMHrh7jtTTBmRIm7/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ug1GkVtc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ug1GkVtc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so2485867a12.1
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809031; x=1776413831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=ug1GkVtcL3hcvY2TaQ9+ntIpARBqmZoQjXbUh4IAJc2h2TZTwuXCJAvOEzaANt3qny
         fUka1GmC4Fcqb0UdHmGSFQz5cQ7O/KRnIa0a/lpXTU9L6kctR/KtuU4CwU2u95oZr8xW
         hV7zCncgHT9OnvKbvKhpB7SI5y8cvvKXQHlxHY/aby5mz/bKpJ44q/31Zb/daTsF6j2M
         aeln597pCeX93rKqmT2FadNuy7Yq3w69HURp2dtGqoNIyfDJzxwQ2ryIDqQJ3+YudDBD
         kJc5Bf2yGLH5UsLgGl2Kd3b16VUZ2gfgbjMqzGvlATwQj6fB5CvQwfYLMnBMn69riBSr
         9d7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809031; x=1776413831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/I8STiLmCdAUWAKR9dG6wn9ETGBCkr8LaZ1bDk3uHnc=;
        b=r3yT/LsxWmcgcskMUW28f35Dr9lIervHStWr5J0KRIE6unQPIo7XWBAM1hvCCoZzEf
         HjrNVVdmzMrNzeT3YrE5OmmpFcKWyW8dSzgixa4kjXYDxMkzqFUFAtqCNG7GyaO1IsvI
         zugoJhknolPhpBBffjnhq1ncPiSCbEsHe1ahoujlppy8FT+hiHYLo0WC7bHTpRadOIBc
         xkZ9hnQWc/B6lENfe9YEDOzjPPOVLOqfKMkc/4Wz+negsuXP7gMm0XRmaikATX1hbp8z
         C6zRvJ/0HQctKt81GALpeBvWyqhK1tUJY+J8TwEdSCgInoFSMJVMUFok7TsWdoWLggPj
         Vizw==
X-Forwarded-Encrypted: i=1; AJvYcCU29xMAtxBitFvKeHlYrMGvUt+mRVvLKE7Iam3IOWMed2DsQoaVjiJM6aDfO7PC3DtYk10Pw3MEPuNZYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLc6aSbbLCZyHrfkNfpKl/fB83fPQ/TT5laQJcFalbiwVB4/6t
	MlU5xKjxSHWF5eMXwYOHOwkXCSWVaZAgfl9mEGR6HmItaLtCjAdINkyzCCc08tpL3so=
X-Gm-Gg: AeBDietN6SJpXzkEDol0Ok5fZy07n13LgbLisxr5qNqGXUkQmhir2Ob1o7AhYBHtKu1
	HlaPp0M0K3Wz8B85dHB5rcfc81yvzbztYneZd2eWilwBgtprmRY4KOO+jU9I3CFaChIoA6eS1Oq
	/wVWun0GdAR/iuNNdsBgdh165Yc71nnKQtlfrSh0GukIOBfWWw2T3MXZ2rSZYXiat6LoiCwcLyQ
	OOjtN9iCVZvXWv45900YtiAmKIwe2WCVQI3deRYIRSNZImjqLgvZW/9XohrtqeQ/i7hqbE9OiNl
	l6GZ6HPIPu14j8sM/OSPNu7GOfNTRbXZbBs/C9qB12A2OrGGwbKsCxfeOA6HW2lMvU21NsJdUxM
	55HShnvlWvcNjZNc9kTuTe/YU6Y2tBTWXW+aGis4xR23AYHsGWsw2QqZTB5gwUKq6ydn69w//8u
	N3uzOZZiA0ki0jmb+Bv9XK4hPBfCcuPUippN8GGzpZPpJ87b3EHLdk05FecMTgd9Hjid8VPISz/
	rA+mQ==
X-Received: by 2002:a17:907:a4b:b0:b98:6a8f:7916 with SMTP id a640c23a62f3a-b9d724958acmr135988066b.15.1775809031197;
        Fri, 10 Apr 2026 01:17:11 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 10:17:02 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
In-Reply-To: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=815;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=B17bVmBmnkP1hcqtGSn9ht5X8PSnvCu4sZaG15J8RhU=;
 b=IwTuVvJsgu8rMOmBfU26s9NGz8XHAIiBWQdtyotBXFTPHny0nzmz0kWVXDv7QSRNEsBbkoW2N
 NlN1jSMUPp9Ad/0y60KMj03S0YNmYQu2xXVp5m43wEW9CKVgyJVRdjS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the node for IPA which enables mobile data on this
device.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..31c6d6627619 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&ipa {
+	firmware-name = "qcom/milos/fairphone/fp6/ipa_fws.mbn";
+	memory-region = <&ipa_fw_mem>;
+
+	qcom,gsi-loader = "self";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

-- 
2.53.0

