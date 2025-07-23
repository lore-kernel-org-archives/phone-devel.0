Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0B2F2C5E
	for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279454; cv=none; b=TKyqQH9+C2QrSA82zqDSmzL0H8dDuZ9M5jUF9tGp5/tACiT34cEMpgFReTWyVBuZqwXkt33Qy1ht67RjuhxwopmL9exD6UlhzY2z+Cgn9+lKSmwskaovKG7bGcLJZoDOxqQU0yFI70c0P5T+Oy4QopjXLagXTGGToMxi80hXo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279454; c=relaxed/simple;
	bh=K3gtrR3v4rNtKDNvKdClFiel5VFa8vRDNJ20QQ4SphA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNDbTq8MgSiaZg7uFWgFT0nohXArdusF7CSzcnxsjMzVeGoDysW4ZuAKs3jyDZAuUB1k2HO+bpYxN9aQ8qdN9CFmqh7OUOofQYp7TIMfvo4YqaAP5LG5gtEIPop5tIuLZTyO8yHx2zA2oGN1faqUa2JAHHDConfq410TB14zolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bFJx3pyp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bFJx3pyp"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so222824266b.1
        for <phone-devel@vger.kernel.org>; Wed, 23 Jul 2025 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279449; x=1753884249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXlxvRgPYFg9fM2x6/GWerbP72ZITNzRraeJqeDjrNA=;
        b=bFJx3pypXBbA2nTmNKryX3i3H65cON9v6hFI+t1tiSpmHuTO+m55vtTfy8B5h8Xrlr
         GZkjk/bqR2/KaEmRP6gVgUG/ONMi6reTbyzxloFlrMPc1gurmei11+Da27qBxOt1Wyxo
         3UakZ7CxK19ncJN3qJwRZEZYA0sFfVyGCkeZCvggc6q3Ma3KoWqAS/RN9eaRE0a996z7
         VTgOTHcwNpnnaLUwrHFLD34ZNGVjQzJtYMVoW+Ti4waD7wAwcBpLYYovAlSXhDd096wR
         ABhWQqy5W5iV5/b0hqVMbTePWoO3ezh1nyOcVj8y5UpqaAO2lRWUlRhaH7qoq2/VzeLp
         RBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279449; x=1753884249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXlxvRgPYFg9fM2x6/GWerbP72ZITNzRraeJqeDjrNA=;
        b=k1/fdObkA6f8FZo49vuIRfCxpKMitoPcr9+wzReXsRBTZul0Gve6NIyPIcme3FzqWR
         ztTlN968OXMclXo5jwNJtpO4Z67Tr+zr1j40PMa78k3bzQo5HIL6O4qDzLWiiRYLWpAW
         IFxiakDertSmnHaR01QnRNu6pKT5J28IEqS+foBuomzqua2iSfaxMOV4jJveXEifA7DB
         493x4Lv29KDjQsPTvotZ8ZwOpfBtI4Kh1XVBHKQpJUL+3ZsyBc8PUrUpR30s9CCJelzY
         qlVD4QdhJkQwJznislDVgAobOFtP4UJltMYngTeP8ieMDNO7ADgoyOWNKITaUZvqe6jL
         K6kw==
X-Forwarded-Encrypted: i=1; AJvYcCVMQm3mo6EhHA+mNTpPjusocgJPYr940A8DuE9a316TSpW0wj5CzXFbCtG5zQFpJG6sdQIOFB5rQkupuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpNlA7FE6yRGwIgHDjHuHJGilNGREzI0rWR/gTyOdlDIrEUHK3
	19O9/423jKl71gWeJStngdYxciySRP0/8ONciSKoiHa+XbhPWwZuFX7leORqzc7epBw=
X-Gm-Gg: ASbGncud39Vb2LkqEk0MMEkdtxQyZuyM/I7tcFkuhcXA/rVttiuVFxuul4PKvHPp9Fw
	eOrST4u9nR5h8VInOlh/34+YmgpRRkTezNtNtbKWVyatJxKpQ1FQI/7HresF0TBgLahLHI6qz2G
	zvqPOjnltzwfFIn37wpo7IBeK89OKVE0ftrnq47jBKRclALPgHbB7nb8s8byDesvN0tdI9s2fPn
	iXyhA3fG4wuVXwYwZMl0b9fAp57uFOqo+LVM5om9Zo4/wNsZOGU+5IAO13GFXVJSpiPlBfFwTPR
	S1BQBcYGDQ9SN9fgKLPfKAiUWh7NP+fDAa3WvsF1kzQMECxP8QeuVL4XMaZZFQa1UGXzHbmAFRr
	xch08XOhG2IEs/Fk14jRAmjiSirYii6KH2GDkTggPew3G/5CUQaZ2+znKglSvU1n4ggu6
X-Google-Smtp-Source: AGHT+IGJGZmYrnT/1eIcps4zEtfRffsyNpErine6pa3/KnG4ZDXSEe2fO8WjG7ZAL71V+qvcwdTRmw==
X-Received: by 2002:a17:906:fe44:b0:ae6:f669:e196 with SMTP id a640c23a62f3a-af1523a8218mr765817466b.4.1753279447795;
        Wed, 23 Jul 2025 07:04:07 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:39 +0200
Subject: [PATCH v3 2/3] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4
 sound card
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-2-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=981;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K3gtrR3v4rNtKDNvKdClFiel5VFa8vRDNJ20QQ4SphA=;
 b=RxD1ziU5OIOKTII+q9x4YZiC1mt53vPsRJbI7UT/HuvqOa++VYLlXajoqgtm3uE+N460AjULV
 Jr+0M5tBARMDwyyxoCrF3bCiebDBN2hZnab1ExzL1hturZGzNpOcxH4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 6b4a8dbdaf615b3254fcbe5f34dee512bf58fc96..5d3dbb6cb1ae89d9f0c376be580129e08a8126d1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.50.1

