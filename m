Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681D3B47FE
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417644; cv=none; b=XXrvzgYbehDDM11gqPBn8cEkrhxlbB6Pz20SQY0NrNGKJbZ5a3KWTJUG9a7fUZEZUpui2LtHNrwrSariEApgyKDC6iJin2k4DvOstb8/5EsU/0THSkUJ7n4jFzbYJ1o7NLplf7QEq6z1eFaIR9LMVSUIlT0y+N2+NvwJOaiU9KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417644; c=relaxed/simple;
	bh=0lcl4kwg6xMYcX6I2qw/0Bb3kvOyEwVkS+hMsOdcTEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RPgKymQ2XmKrkr76m7IF8OmOH+mEg5MaA27LtgQTtPJOeC/1y7W+c0rW3vc9Yt3q5iw2FaCli/3iWisXpWH1OK/MVxK+cEN3Ow+KvKXu4MkCIqn4qPyydqexaKAwJeOmzQAh+4yrCsUcYqJK+f1zKUZ3fsCS85Q5jFOweYeTV6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=r+uhas9o; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="r+uhas9o"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so3946104a12.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417641; x=1774022441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHqknoZKE7fsrxy779b3139XeipLuzq0YFxuewlpd04=;
        b=r+uhas9oYeidnAhxYrZj9o0V/4zlIDxs1RnkrhJ23pshr1JBLUJNXCralaIRYPV44q
         4qbKm5GVgAK3HJD+FwATkWmJmvRy8LjByhYhPS35VGtenK9YstKycLXkCiw+80JWV7/f
         VWZ8QckRsNnwrVuBvjWXxuSzLT9MZ5NCT99KoODljUr3Zp2pKuwVTjj1BWZk4lTsHN47
         A3eccmsB4oIQ5nkkbwKQMGBI/yisZlCRabHTzbkQmdvdHkv3EQKiCYz24KVBnl51mL+m
         N1000uQgoaYGU0eEpp445w08IVmhiDVjdUCqChHyEGdQo1qk8Cl5mRSFL2D7iUB6xt3b
         8Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417641; x=1774022441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHqknoZKE7fsrxy779b3139XeipLuzq0YFxuewlpd04=;
        b=YerA5no1EbBLShIqwn2v/wdylSytLS1jpNMe3BOdbtmDfonKbNtcbIboXOQ5TOJ9KK
         iWQ1km5X+aNBp/83085LFZ7vKFIYsnTSXag0jCK0tOsFqpWVLrpzzOcuKqc82P6g+uRu
         X4KXZdv6CzFDrtM6Pq6fvb8+suJ+hhib15M1Kpa5q6N33bejwaCuYl/cyZOQ8mnlfSHN
         FCJPVg5KDq/PqEJ2dhShmL4o5vd0dSyoF0Y3khwXMckAPpSBe55xbJ6fgCt+Hx0AkfSm
         y7i3Y5JeiYuRI6ErtPEHQGrKxBtOeSANjTRuBr2UHQtGGgzw44J84BxjQDZYxdpNqGeh
         pJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqUp/TIN6ghLfYEBYWU66O4Va1t/N8x6e2205EmQx6yEJ+IiCTtbeaNfYbLNG44CIOdzQ7XRCWqyXUBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6vN6c2M16iGwYp2Y7A3rVhT//P4y3EeakbCTRkkQvOVX6sg5g
	biYNi2DA0t9tfrOxuzoRvFHizpWzvwP5u7z6AKNt1g3d7X3VwPt7gtPWY66sr1PoUUkETKN+C4h
	9n+hL
X-Gm-Gg: ATEYQzyk8HH4x6QVOdTL3Zq2d4XSYgLNKJ8KQGMDKaxQ+hgHpEfh9vJiwSGWyf2ahQ0
	3+MN8374GGF3RWkBWa7FY7uOUctI38z07d5/wR+8aeDfXD+mka0PSrZSHt+UrOGZJtcZe5IwO2Z
	pye0z5I9B3r4fE2Tt23OfIIp55oyPa++35aEVTIdiVB1JLCAScQuAdd2l+h04dH+WixZ6+AC6wi
	k6e1J8k2va2HhXsg1KRPuU1FwkwvZYJz4kzWxjYjGITDLdBV33E1UYLEVV3WVe8EpobcRlWl5OX
	0dGZqNN3iorTZpf6vRjwzYljzSSl2HfaEHn0ZLNyCG/AgC4yC/pYfBnnDrumnskSBtr0kgjpGZD
	dgyAFK3RKloYrTFl7HLSic5w710LQFRbgVkBPIU+8crdym7xvB1vrBOWNOuwu9NQAO6pfqYVpMU
	g54YlqmstonuTQii8+x8zdzAAOp1aN3i9dmX+wISKmzi2dPx+CaAuAX7hWY7KWxzyWGRd+9GpMD
	KDCXw==
X-Received: by 2002:a05:6402:3642:b0:660:a23d:4666 with SMTP id 4fb4d7f45d1cf-663babf0b28mr1753883a12.18.1773417641046;
        Fri, 13 Mar 2026 09:00:41 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Front camera enablement on Fairphone 5
Date: Fri, 13 Mar 2026 17:00:37 +0100
Message-Id: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VcJs+6UXDAVX6W4SNOxnRajTqwI4
 rsb6vI7cP4NMglThkZtILRw5iEVmIuC+A7pRcjPYrDaeu2Mw26sMFffTzJY61B7H4isN1AOo1D
 H6z92b08LTb/SnM8RHiETxqHveW7UcrtqlOig3fcD97HygIgAAAA=
X-Change-ID: 20260313-fp5-s5kjn1-80a866aee261
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=764;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0lcl4kwg6xMYcX6I2qw/0Bb3kvOyEwVkS+hMsOdcTEM=;
 b=ovAVA3KQzaGRmmd4JKjyFPLw4kz43Y4QJcFmAvJQAJNw1pZ+a9dDk7n6jyOfMBVxb56N4zxoG
 lB9uuQn4m9cCsdZpKVScM5y/6iOHvRiz/fRgXLLPBJk3CWIlxcU3p2g
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the Samsung S5KJN1 driver was upstreamed recently, we can enable
the camera upstream by adding a few bits to dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support
      arm64: defconfig: Enable S5KJN1 camera sensor

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 128 +++++++++++++++------
 arch/arm64/configs/defconfig                       |   1 +
 2 files changed, 91 insertions(+), 38 deletions(-)
---
base-commit: 3daa4f5dc6cc1ac1ab2f95b5b4c16bc5fb87f48f
change-id: 20260313-fp5-s5kjn1-80a866aee261

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

