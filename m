Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48DD34F476
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603223; cv=none; b=dAiZsuuK+tdwgv3FozpxcbVLvBeNsqhu3gsP1xlrNZ9om1MbBZEi0/iKmj5upA0BeKBkEl7nmI55V5/0m1IxMtooGU6yWpzUQG6i2TYxTOFLzvZzGMKqplvdiAcSrjfLYe7Q+L8S52V1NjVPXPP6ssLV2feMKl3Bq982cKH5Bo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603223; c=relaxed/simple;
	bh=6q37WeeQdbfyWtDQufhuNOaDmHWFyJ3gZhhYFvngdNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLJ75d+hI7rbHlhIq6KOzOFgHxCoeGRhnNlgzRI1yuWJS4ENKi+KK7+MZsE1Vb8lE/kfu3QB/c2h8yJGaNoCoVsRQtPUZSEpzISO6pYb1/Vp269ThnyqdLOk23qJ6h0/nFOvEYwwXgTRENC/iyiUz4T7XIl1H3etYr/r/K+G9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cXv3WHM1; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cXv3WHM1"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b883787268fso1058785266b.3
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603217; x=1770208017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmjzieLPBCEhG7O94WSZ0LkfVKWhnb5wTsqAsIjf3XY=;
        b=cXv3WHM1WkOoYSYyQfw2nBIxGtFfC9RPgy/J6eSg1ulwE+L5EXhyFtD/5e1NOPStrp
         /4MeuovFphaK6OCv406FC/wEE7S71XiMs3wwH6cePTH7iUppnn5cWPCIaNTuisZsbMPi
         utr5uGboLZeDxqhwyMG7ywW7zs3kBmPrYyzsm3NsGY2vRN6l/ZkWW7s0accUaOkqRc2A
         UgfKbNJkg5LMylM/HyBhytrGi2YhVOjzTukIjx12lc0bZdM6dtZM40uOvP56Ri0NpgB9
         a4oU0qJUNvy1D6yIxRYymN3eYqpG+vB+hAtD1vfMPtD26dLnKkQud9Jyf8tO2G9MgvOb
         egNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603217; x=1770208017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bmjzieLPBCEhG7O94WSZ0LkfVKWhnb5wTsqAsIjf3XY=;
        b=d+h5KzgrR2982yLMfDhKBJmligFd7ZrjS5aTVFljq2gr6A6Cbs7ol84pRVfNS3hngm
         1/rA6D7eLoLTdrqVJUHJdJhLsX+sASLEf6cr7j238cn67lddVwiHyBNnAO1i55MqkWVt
         5/GKmzmHmYk50Fu3OH+5Zpf/iT/YmnuHI9MO/ZxsjYK3MNhfeo1fVMoWtd8Qo8A5TsAa
         hoqdR/FAUOWz3czSEUo/SnhL0IJzCdaDHt1pUTbEpLZ0LeGxt3Cxec6AQKHYO1UWmQiZ
         ZA4htBvRGLjUacj5MHeFlp13kKMUqipryQo52RGOKsECWqZQ8oiyaXrnxkQqe6YZmWZr
         CYgw==
X-Forwarded-Encrypted: i=1; AJvYcCU1zphzBV3FGOnyqL9iNmsao23tduD5bTHsg0aeWfcsYTpiYXEbKZwUWPkIFQp9ghJuonKsgRaFLADQPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx38rCuYN9hKrOD78guAt/Ajxy3o+5Qz91GS++L3BPAislqrB2
	4Ah57IvJA3V5Fw1PPxp0nzAjOZEaGRXYrKMBAgFIPtxN88wYKGdrKeZFtTsD1BEn/CI=
X-Gm-Gg: AZuq6aK/JUKxSQi8SCVMaEqWzO+SbzhaMxXmRjiCEpB3Z5cI+q71KcAEhIO8iwELAjk
	da5ZElBj68W5bQ/ZAYqB1Lwes+elrYh5o6hcY7vFKgk1VHIpSv+wpsDn4Y3g/mRaImV4QOeqkjR
	/fsHpOhZ2e9sm0oaEUq7fTzZxkDxSycdmTkQJxuGmHnyAhk8LHhybA7xpcg8uGIvyrHc9jaTyF4
	2It7K4r7SQX+TIcpTvTztl6TXX28okzKRMv/5rTQ/0RfytSExqiQ0dMRm1FXLLvk28YgbQ73KSK
	F5ICzAYwxtUALpj2Dhp0hAEDPlkp9DUL6Q+Z6rIxIRKS/+Q7DmqrQkO++G3iF7AghAwt2NB+QGI
	vJGXAWaI2eLHLk9awcj+tBxq74MwSO2Isctnrbu06VViAhVKmJIsVcbMTR8DVHvBir2uaORnSfT
	B7ggOfLK7IBFJLS4T0kG8DHBoMviX2fWU5aINvRFzqpmRxXLQdRXv6Xkhp4l9MoZ4XaA==
X-Received: by 2002:a17:907:9688:b0:b8a:f7fb:4f4d with SMTP id a640c23a62f3a-b8dab1a4686mr373282366b.16.1769603216835;
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:56 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:53 +0100
Subject: [PATCH 5/5] arm64: defconfig: Enable LPASS LPI pin controller for
 SM6350
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-5-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=778;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6q37WeeQdbfyWtDQufhuNOaDmHWFyJ3gZhhYFvngdNU=;
 b=O2JhrNZ4cx0yR4rIclFuPK5si3IJLYw2s5Eatlepxy7kLpFKU0/o9C0bpUkv9kgglYZW4StSQ
 pnf0PMnNfZeBCJmTjmFtj3Uh+/chxTyFPoXE08AMOzWjHIem6EMS5tE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Build the LPASS LPI pin controller driver for SM6350 as module, which is
required for audio functionality on boards such as the Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d383..5160b81afc6b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -694,6 +694,7 @@ CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_SC7280_LPASS_LPI=m
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
+CONFIG_PINCTRL_SM6350_LPASS_LPI=m
 CONFIG_PINCTRL_SM8250_LPASS_LPI=m
 CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m

-- 
2.52.0

