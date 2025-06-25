Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB52D6635
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843132; cv=none; b=Xc7qV5whWZ/ZvAnR5qPQGW4M4t72F1TRhVSgzaDNhCYcJ94gHoczrKwRmsqfCVbT0RaVKRjo7OvHrXCbsmoYQS0LiTqOQgNkH6UxQLwaNXBJIp5wtk3LxH4G3q112C0TcnpndBJxNbg0FoZrJURdsj+IDqD9Ja8GhtpuNJWEwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843132; c=relaxed/simple;
	bh=szlnn2M+4cgp/Vz2v6MmXU8JqhkzFEwBi7m9DJTOn/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pe1fvTIui0ub1+KIGXHerfWPKigGu0QwbK/TUber4lpHTQSlwKKckL67clHUkKS/JEzEMOLU8mx5m8t3OMRjL0A7qXTPAvWBJoAPXk/9gSRSqqMWabn6VqIyArpYzaR4bagVYZz6eC/N6WenaS/QuHDCfZo4/DWIrT/XiAHMj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O1I/1ghD; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O1I/1ghD"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so1228789a12.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843129; x=1751447929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOpNNHlpH5P/vO/w8RICxSBAiEOYxdXjmF7zf7NwIHw=;
        b=O1I/1ghD1Vg9YuCPBgrisWzdXpCp5icaPQUmeBTSaB4M/p06IU07ONxNQkqjDJvY17
         s3UUuQuUM1yVnjNt4sSMWiqCJWecDCiyujNk7apLatCV+UyEvmDuqq+2FayvMFL8MdFO
         7fEXtPAaq5QfuAd/94XxmKJA6njNQrDr1kKMdZDFmq2S0ga5oa72pTHno0q+i/XkghcH
         3RAdw59aM6D6ORs024cHtRrjm6yT0M3wXcExI3wfHtZtMqDo7lA7n0VQiGZT10AMQlP4
         YMsFtQnMwXK35mwRJ1dwfsraKs+ly/hwN5Z8p8KwIryPuhlA/sqmrPeY7Klp6PMh9ZlG
         8fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843129; x=1751447929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOpNNHlpH5P/vO/w8RICxSBAiEOYxdXjmF7zf7NwIHw=;
        b=YCRIalmsb8rWxHBtXxDg7mdrGHRVw1R+/+T8gsebsonEWdCdn4AIk4lDAQ42KQB9/K
         2XIAf8qqKSf9uHLjfewNycAHb2F2xxGeIFFTvGw84Qt76hiVrV7UpHUu8a9pJaWrSH0D
         ZMMnSxCnJyj6w04FkwgrdAWFWUFi9RvIjm4oYhlE/Xm64Ag3GzFAts5PXqyiZ71D/KO6
         qjWgwcQsalnkyFPdDQNHMgJ+0nYkoFMqvV18wXm4shRwTUNbZL9RoOJgs2+yS+OhYOMr
         BMV8rNe5BCjE3frTZRAt8m8Dgu0rUCptjTC9GxOYtZt9+NEZrSyHhGCc2Or/HMTg2OHb
         hKvw==
X-Forwarded-Encrypted: i=1; AJvYcCWJcu9XsEpd71gnQ6Ek1jXTbnr89yuhS3a5qPrlJpmTYMc5pXMEmpyliI7trZqvMM/bqeyKhseImT5Dng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQoEtnIHO/MPKlyd7BHhFn14ggK3JU3QWFObk5vQveEvzqBenl
	pK8iacboltZIoMYtvV3RORpnkFLEJA6K6tcWX4eKnmRQyGjh1EG3GcVtJ1WHG5YCk3Flw0GS13d
	xViAE
X-Gm-Gg: ASbGncvO7++6tHaP4gKrYtip4AKiHpFxVStUkcGDaeWgM21N2sNsaddHWviz2PZPRUc
	0rmgvBavq66JcEq5yD9rmDwVH7bONnuRRO/SA29+95+q/4t9nUnx0V8n75Whpg2Ora6Cvcyk0F5
	jw3d4GJc/niF+n8pR0hwNSgcKrLr/5eVYMsONMUHiIBrQeV+8GBAc3zpQzviFRNv1iFA+LPnLgH
	DpHHL4OUxJR6H0tiGbGmsC6GX6eg4k+Au/t2qqR1pSASVrAYG3SzwD7GAPvMOUsRT5rky4l86sj
	EBDDmjmuEASaOWXzJln7y82KmQSrmTl47PFuPl4BxCcKCM7uXf4wOn7lyniHIbFizTLFHodms0w
	YHfA+AxW9ON/tSmn21TnnguHqHPG18KlH
X-Google-Smtp-Source: AGHT+IEOlgJqlxUy9xEgR1EbV15vfXFfr7HB8R+KVivWIV+33DBCHB0Ad4TkImLeHdAU0HFbV+mjQA==
X-Received: by 2002:a17:907:d860:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0c4e3ed50mr133473566b.28.1750843128605;
        Wed, 25 Jun 2025 02:18:48 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:37 +0200
Subject: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmxr2230-v1-1-25aa94305f31@fairphone.com>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=860;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=szlnn2M+4cgp/Vz2v6MmXU8JqhkzFEwBi7m9DJTOn/E=;
 b=kXQSAv2Fqt7HSSldKm2UCk1LLN5WSSvo98wA8Yz4WCUHsWtZJIlbSf5APb7ETgs3Rhn0mt2t5
 Wy3QohD/DpmDWASWF+nbSL18ULi3osoE4xp22xH9sbb8MMeYKpTv7sH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document compatible for PMXR2230 Torch and Flash LED controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57ea6dbba9ce71280bc3cb9f74db83f..8edb706d72996f8d7f0f5c2d5a5910790660275a 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,pm8350c-flash-led
           - qcom,pm8550-flash-led
           - qcom,pmi8998-flash-led
+          - qcom,pmxr2230-flash-led
       - const: qcom,spmi-flash-led
 
   reg:

-- 
2.50.0

