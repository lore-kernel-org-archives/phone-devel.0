Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E22147F9
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 01:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328741; cv=none; b=fUUjURtkahYpiOmShLs8LuzvzEsC2WA7RvcjVNeq7WQXkdJHhar6+P9vA30GEIa6TBrEjwfm9Yrzdh242YxeCaUXE8cVQgZu52U0OY96lr7GC+rsJraoN5etv5+wMFayIrB8HdkQ586RFD1aZXfMV+I7qAWPc1UR3r8ddUYJUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328741; c=relaxed/simple;
	bh=+i3BTfPhsLE8GEo/94/1SE3mgTKecjalY7mtMdqKORM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lw4x39ZLrozPmItcHeGJC99RC0+r6bItmmvsmeR41Lvzuto3oVmUgBjL0U9e5Fx/6SbnCXXnWE7tuS4V1IiTf6Lkg4eJluyXjJ8HXQ+StUhS+TZ6S2lia+N4wIoOIwKX3h0zpYyiREawTps5cDWA8l4RWApZ46UPJAqbGPoIVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ri/GDVTu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ri/GDVTu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so80212285e9.2
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328737; x=1765933537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHcSDCZPYXhd26Yn2LSvoK/Mf/qVpncEW7C95ovxbvY=;
        b=Ri/GDVTurLUN3C7rCjTK7gMxfgCFTeAyd+wgZf3VlOWirmins7VV96LR0XWNU8Pcbk
         KPcZNfqm/TTxCZ5W/4NoVrVzpqoTMk2xGaec8Uq/UEUdQjZBcnXLj0fFQDfFVRcsLu4O
         3d9u4Cek1OvQq15QHkhWoUuk/JsCinEnOQW9fH/A5RhJbVXmDMrVVvFvUc7Tsrm+rcZI
         x52DwrDBDD63Y+6YAFMqyybxi3f8ZOnA3PsCJn4OIO+o38haM6oJQtSDgkl5mzZ7Wux1
         4LuksXWI7P9BzNESHVl9gsM9LUBvRtSrTDnAfnk9S4M024XaaiC+3uPsydu5XsZBP0a4
         mPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328737; x=1765933537;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHcSDCZPYXhd26Yn2LSvoK/Mf/qVpncEW7C95ovxbvY=;
        b=UZevi4vbNHkCwFUjzA3jpqsJfy2A9DVrK8YRAT+bxwKKjOZ3WnDWTW5hoR6Q7BPuEM
         raKOmjQQfwr4cW0qEqIUz7Lcvbyk4IHhspHWual3vuHYBeCB1aOs2qmsnV0dv92urg5z
         A4CvkatE6mXsDpBBL1e4RRTu9m5f5+BOJ3XEvQSka9u4J0LkiEyONFadZpAD30DCU+9a
         G0UOYasDroAIhxph1gfQM5LeR+nGCSQk2DALFXHWbM+OEMXfBLm50Y2l9XBamaoOLt9g
         p3g79oF7jvTGkvnNCEEZEUQlaa7fSnjCytKgexp34fo7ZFjhMFz3S5DmMTcn8hoLzPK6
         b9lw==
X-Forwarded-Encrypted: i=1; AJvYcCUYLsEKVRBWVHta6FxvxW+Uph03LP0IIJpp/0My8yDEgwiaQ2Y/hTOAbZmNirY+2h7BTcI7AztjrSW2cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxLO/0cASNp1QtZzqSoWryDp+y6ZBKzZ5Hk4jvzJ/DxQB2AzHg
	x7JIbvVVwrp1Piy8mJEy8Ked32hlbDcGv0vfNCIy5jthW3aLPrHMH2guCY5MvPo6FRRf1Ux9WA1
	7Al71Accv3w==
X-Gm-Gg: ASbGncuf2h4Ib5d+FaPsPXHzXvpBvPA36jLq2Z1LYTCAUQeMErBWMo534j4WKQpJrPo
	f4/On4iGCD7uyyJTl+99PPncyQRY5DuDr7cmS5XxNROgKZgK7K/skA59UQRC8B+AqSEt6o8reZ9
	UaOCxl75P0kYT+eLxwlBsxM3kpTk7TI/oJOBWZymQBcagoBrLWNYmpmNrt2G9xxZGjqEWaYgESj
	IysO4xjLfcYy3PpHXDbZTDFvhAtxTHZ1xgblriDncVbNQKZJeNa4fUxV4Qa165+UWzeSaGFS4ei
	V73E+xFq1SYJGBt2NKCmrgDd6PQMyVott16JT6h+gyIS3AvY+wlcp3IeA8E9UbV6vGQFfzqjxKG
	vTiGlmPx0HNASsW89HIHnfPucWjArXGV/9RND7HNo1/6+sg8V2gvJza9sRbjhEEu841ez8aAjSC
	i0nycevjlwHJrHicglRpPq/PyACJwJ8m2F6Dgx88NsdEoMqYbG+Bb59WFb6+18
X-Google-Smtp-Source: AGHT+IG0T6nWXe3W7j54A4PIsvvrJ8+7alDZyq2DAzB8aUB31Ina+UJT5hJjNMeivMH0tZ/Ul8SsHQ==
X-Received: by 2002:a05:600c:528e:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8378c79emr7622015e9.17.1765328737169;
        Tue, 09 Dec 2025 17:05:37 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:36 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Preparations for camera support on Fairphone 4
Date: Wed, 10 Dec 2025 10:05:26 +0900
Message-Id: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfHOGkC/x2MywqAIBAAfyX23IKvIvqV6CC61h4yUYhA/Pek4
 wzMVCiUmQqsQ4VMDxe+Ywc5DuBOGw9C9p1BCTVJJQWGZNDZC1OmhLMR2igfxKIN9KTLwO+/2/b
 WPvs3PC1eAAAA
X-Change-ID: 20251210-fp4-cam-prep-640342df0834
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=883;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+i3BTfPhsLE8GEo/94/1SE3mgTKecjalY7mtMdqKORM=;
 b=WYroaOjCibHjE0paBIII6ZqmzENJydkJRzz6ylokmPfmofZB4qZ4I1nlYmOCU7+MSpxAM7NY/
 udMRwR5fT0lAWBhaWZdjprM3ucYrMDCO5qetfjwrRt2D/WWahkT8brU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Start adding some camera-related parts which can easily be upstreamed.

This contains the EEPROMs, fixed-regulators and enabling the CCI pull-up
voltage source.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24P64A
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera EEPROMs
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera fixed regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI pull-up

 Documentation/devicetree/bindings/eeprom/at24.yaml |  1 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 72 +++++++++++++++++++++-
 2 files changed, 70 insertions(+), 3 deletions(-)
---
base-commit: c75caf76ed86bbc15a72808f48f8df1608a0886c
change-id: 20251210-fp4-cam-prep-640342df0834

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

