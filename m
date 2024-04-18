Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9F2375B
	for <phone-devel@vger.kernel.org>; Thu, 18 Apr 2024 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422241; cv=none; b=ELHPo4KnnC8bZ3ND4cq0CRXO1tJNIBbd+rLcE0K7JIMHx1dupijhiTZRaxD8aH8FgJfkt9PQuQHwoZ220GZb18BAcLwqHzo04GKrOh+ZQbhw2ITgop2fNZevn1nUjZE2HN3G+x1vqflrjJA2/YN3VBnPwQWddLEidApVpXaRcQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422241; c=relaxed/simple;
	bh=IgFSS0qtSnyg++H1olUTQAlmpttnmEZ7gZvh7AhbrdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqT2TPalbG0CdRCRJ6UQwLAWT0pPHbYXlwmSaEdFrdAfSoFT38FdDhFg1WDL+mFr9k94hWTf5p487Y0lxLGWw3gS/CJMOfW78+B6DS3sqHn+c0Zkx8KOu1Y4fJBWJLpsKeLOqROyZI3zUZQnfu9fq0NqRMVKqdOerubTKy7otxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wRzKGQMy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wRzKGQMy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso380254a12.3
        for <phone-devel@vger.kernel.org>; Wed, 17 Apr 2024 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1713422238; x=1714027038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39prjfdUZn68Ea0wBSxJWy7y6KU96R9Wr42vUXg8nHA=;
        b=wRzKGQMyy7LZx/hWyIHPeJCSYHVjd85B/xXbyMhyL5ETecUcEI7Sax/1ErjNMouwPZ
         kV2xitYzMf9GEdBwhRHY3ii5qSLtfYaLulHMKZHQ0qECdQs2V6p9g3xOFW5g2OIWKPQs
         zJgl7dSGegGW8LqwpRM4plOcUqOWmz8J6aUUAwUiwzuUbqHUD6MbA0xKdCAuAovFlBM6
         V84UhqThjyJULf6Dhbn/rvqfybrcIKIPqSF0Fl6At5zIQWSZhtKayTsq6hlqd5F9hDXx
         MtS9UBbSSDcDqN+nV5i/FTbK9EwLTZcSse/Z6V7v65nFvD2jxLHV2OITD3dScm4VD30d
         Bu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422238; x=1714027038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39prjfdUZn68Ea0wBSxJWy7y6KU96R9Wr42vUXg8nHA=;
        b=Y1AdlCIeIZmvavEuYtRu8oYo6Q1z/eqbgE6kdjaZTcA3bQEK5cj00MY8JO2jwI5veF
         DzRfL0Tj2L4Ia2x/NGvK40/ctuOGJbmNM/Lcnkg6wMvV89/mv0v5T9vkXLEKaeRUCKIp
         IymBmHm/wj9cDTc4C2SWhMlaCcnzaY78+SHmqX8WTzpAAuLp9x5YiINieszf86NamC/u
         lRtxi07fwQl9jj9wypEUi4g+znTHO/mRLF6AiJz8IntUEI078gUgYJlhAIKIMHJ/wX5p
         R4rQ5ghsBfsgBacaMhz+N4zIDQXmt+mSfX7F6OSE7HkKW6jzvKkZvR18jScC2TH4KPFv
         YXMw==
X-Forwarded-Encrypted: i=1; AJvYcCUW3K0c+tHMPcgvPcdf9EsY9r7gQqvH6k1/paqPmwiKpB+dXwvy35qI0xWbEPK0Bewfcuo5a5obFmvJV7tMYMJqFzoky2rAh82bngQ=
X-Gm-Message-State: AOJu0YyRI7C6L1cPIaTftWsY/96DCIiCscmzeKtI7wpijBNuCvYyf70y
	auj+qPI/ZiTIRAXa+7C4fmBmdj6nYJxMqJgcUNZLoyeecsDnnESPA1W7xBv75uo=
X-Google-Smtp-Source: AGHT+IFMMUtN5QDG0RL08DrlOyhBUpv/2mzTf2vAZ1XgVxE3n0VWHXu9Xd2BxaI1nvTV5u4aIeKVpw==
X-Received: by 2002:a50:c057:0:b0:56c:1696:58a8 with SMTP id u23-20020a50c057000000b0056c169658a8mr1537498edd.0.1713422238001;
        Wed, 17 Apr 2024 23:37:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cf8-20020a0564020b8800b0056c24df7a78sm472277edb.5.2024.04.17.23.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:37:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 18 Apr 2024 08:36:54 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: pmi632: Add vibrator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-fp3-vibra-v1-1-b636b8b3ff32@fairphone.com>
References: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
In-Reply-To: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add a node for the vibrator module found inside the PMI632.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 94d53b1cf6c8..b4313728f3e7 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -200,5 +200,11 @@ pmi632_lpg: pwm {
 
 			status = "disabled";
 		};
+
+		pmi632_vib: vibrator@5700 {
+			compatible = "qcom,pmi632-vib";
+			reg = <0x5700>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.44.0

