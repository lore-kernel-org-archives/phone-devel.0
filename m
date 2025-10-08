Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13242C0284
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 18:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947679; cv=none; b=p+ufuYe8UflLo9GZEVKB0flyqISoo1NBS3YPGdXHwSCAG9B07SWx0wLs+O4jVTRs6k5IDxiVZQKlPu6h58fu4RJWD2VWYWCPGZfouw9fwkRdVjBouBn8WyRtQrzW7rvHeue/Zzc6WFmcHf2tMKYBhDPaUzA2hxM+epNIkguoFHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947679; c=relaxed/simple;
	bh=p280qPQj27zEghzXtASKe/5ZJm4NWAcJ5opk5rxq8ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9KUD2mxFetQ1+wMHtfBOnyMbn22alIydCQJyhfyVH4EQkdNIJL3i7/TpnbJsXKFwhRKJH/fNkYG9lPLiNCknRi+uFg2mWGI3XrIFWVR751R9KjbdJzEqG6evefKe1F2d/Tahr76RNlHFGNCu5IV3oacKg+EARj1jGxabtUSk1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQWqA5uC; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQWqA5uC"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57a604fecb4so193962e87.1
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759947676; x=1760552476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=CQWqA5uCO6YrLJLyD5Ag8Q3OCQsbBEifreaWauVDNzX2aEBC836ib+3SnmlWYT3fCK
         y4834jY40lwR1p+j4LU5WfmvW1InKuq+iFaPHf9RUBTjYxq7/fWnLgPdvBDbOvrK2Yci
         dP7cqHTWkkswyjeIZVHA+p4skXJxjHZJRVURZ0t1Vyi23GD8XBUQI/u90teQW31uqpnC
         HrE5Vo+y3UF5wM7fRoXAMYZcq/M91mqibD3DME1NJpCsXqnN92PxnsL38YlFBtjWZGV5
         8xekXeCXLnLU+WVzwORjkk7fOid+I18nUpTBs7o83SIhHUAAT7p3HDOekxzAfdq+E620
         ferQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759947676; x=1760552476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=U6dYAmjr1vR+FZ6OixRNlvqMSrDPa+1prbrOyIpnAArehd3L0nThxnnbTeNvqg7RvG
         IYqi84mtvlU6R7bGVuaJ8d51G+4ETMfnht+nr3aQVIVbxVvnbagojCfzYEonTCNfw2sf
         kIRaRQ6Hgp8kJFqwCK7JoHnWygu/MZF5MwOGUjBG/GgqKheYHVgEsYqoyKPPKCUv/zVi
         NdTVtnpQk1upvaH+GQk1AlQAfbnJXFGou6cyP8Pz/s1r7KYzCOSSpwG1ZPuw4/EpOciC
         jsGPoIUhQlN3nKbx6w74QzoUdJoRJiKBk4NFnFcpqTreH0l2o3JtkuJya5/7iKdu0fqe
         g+eQ==
X-Gm-Message-State: AOJu0YzCx8Fo/cA7ZOMk7U/tgzGGks6fKe4L60oLFHw9/CNNhxHit8do
	sqm2BljiWDBD3T0iNF9XBpEno0ub201oexRT9k+6vpPba792EldmmPeG
X-Gm-Gg: ASbGncs1ZpHCN3J1Hw89zHSyyzBeYutBdsycoPUinOM8EiPn7VGtbPMV4cafV4A2Ufx
	W5SLn4x48rR310l2pqkmM5+J/X0J8jyPpXSVrRuPsNsR8B3SZDWdiHUIkBQLuTPPWL6aq8DQnIZ
	1UcogsslZvKsYHvkSgfK84KGKW8uoMhyKzDeDK1A1dE2PkPN2cD1E13tnpf4AZ62bWnHPpQj7g1
	Ii3/fjYPPCKrYg0Yv9bXxzFQMmGAfHFPJOSMUoVB6oU7lxd1vVn5oNTTe/pnLgGIUVI04M82+7G
	Ean7XGuDx2bYk00yX6niRE6tqGdSzZJ7ROPyrSuCPBoBJ4ANcCErCVpIxJV7aYUrzBYSv7sMoDi
	AEU32Lp9vfbithGmQaMpripHg4K8pMaLffNHVvjQSpPC0
X-Google-Smtp-Source: AGHT+IGBB7GaBBYuVPaybijJfuURxVJRXTNlNl7L4zMNhDPdwFslzUyqDTqQRf8bzBEjERm8JtK7mg==
X-Received: by 2002:a05:6512:1302:b0:58a:ff9c:d107 with SMTP id 2adb3069b0e04-5906dafc4eemr1434243e87.51.1759947675777;
        Wed, 08 Oct 2025 11:21:15 -0700 (PDT)
Received: from crusty-box ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb1268sm223930e87.90.2025.10.08.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:21:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
Date: Wed,  8 Oct 2025 21:20:19 +0300
Message-ID: <20251008182106.217340-2-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008182106.217340-1-xerikasxx@gmail.com>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Asus ZenFone 2 Laser/Selfie (1080p)

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..1ad77a68fc11 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -88,6 +88,7 @@ properties:
 
       - items:
           - enum:
+              - asus,z00t
               - huawei,kiwi
               - longcheer,l9100
               - samsung,a7
-- 
2.51.0

