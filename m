Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A67815DBA1
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717470; cv=none; b=FFs0YGxGYE4zO7UE33cb1SfGux+mMYBOMv5aB/nUoLA5qczjMSmFySCMKV3XnT2QcL/Q4LE0YrAENHPpP0AvN1z/7HXGFSES7DaO9pYJ0XoYL1lqG5RbaQz7KUXVa2gscg1z7mRWrQNLcgu52cxb+q41YQZ746egkYVvaSgiaRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717470; c=relaxed/simple;
	bh=9dL3D/FY2UQlJeFNSfOZwIBirUv1VOhd/HW8NFB4Hik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K2PiLY/u20e/WG1tx/FYisrEEESgVJ/UuYnK2xPzT3QlvbslN+0vS6JCqj6T3W0r0g7BmEStC2nk8zACq+Fc9gwCINWFIpuAc9VaAgARciL5dCiefgfQ7E2bYR07PhjQLwdiQ+rGGqMwyYcRZZRu6bwvwHjaOvUu5mPiAk8aBIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=P7Bvzv8P; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="P7Bvzv8P"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a30dbdb7fso9663100a12.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718717466; x=1719322266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgII99Py7AejfkT5wEBcEQing1ENE+rjGC2Yt+MvufI=;
        b=P7Bvzv8PNGe9+6bUt3g+qbw0O612DzUGQSRIoZ1a/PoHivkFmEHPYPfP4yQL5SEcPM
         bPH8IhFeDPBpbjxGV/x/Wi8Fi7N0sZWJkqb0p9HWjMHzCA6csfgQYTo7oaPMQbdpmURx
         ssWLSoFheogVXIo5qVmOQoct70v5bVH1ZeR7mewgZO3CYzGC0TNAfS0S9iVKLZ5fc90E
         +2Jp26QPds9q7cSD6u2hLQgrGVE8c37I8fWeNrE9QbDGlZuy00nnxdV54BqPi2N0OpNI
         GG6Syl0NIzOnn1zqWprCHHCgMG3VIzEwFDQYv10q3R3FZqOpqfojzDj3/1LjMkadoTF7
         KrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717466; x=1719322266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgII99Py7AejfkT5wEBcEQing1ENE+rjGC2Yt+MvufI=;
        b=lqBilZcCiho4yAdqzDhcLWybVcyGqpbMWVwMd4/spBsv7JApIa0wd4gzgDb1CMNwJk
         5OoX98JwTz38hPm9wWz+J7BMXvgos+kBoRBNxABMj6cygfUb3g/Zi15+iHfC7KTpex28
         CzcuCZrmDxHkoX72GtOZs/FHD51962pLKZnrNEN7C4EiAnoiRx2lRqLywswzGaY+WxXN
         SJpo8278rBqrShPV/GQUP73tz5JEQqt/xw0VzS2ku1wMjOr0t4c4/pwoWs1jovi/9w5n
         eGK3PO94t13ub3RA8k1N8IqaudIhFWeud72HeWTf7vhcVcPNh9Rle62bZnTrG+EXpX8l
         SB2g==
X-Forwarded-Encrypted: i=1; AJvYcCVSgTDucZeuU29ymKsEREanbzncINxX88CAor0ez0SKOWf98ZGtozOz4DavqcA5y0Xcwk+hq8RKW7OulWUJh6pH3ixsdgkNHHYkLfg=
X-Gm-Message-State: AOJu0YznHbdmP6RZkBjbV3SvJoByxeyL2L9zDE3hJX672G1Q70mh9HWL
	RGM5iW7fEN0GOkAFf6kClflnsvlXaBqceUdKqltIWmOw/MO7SUNuj9RYM07TSdE=
X-Google-Smtp-Source: AGHT+IHfSXaYJLdelb204AVXLxNCDDXv09yJDE8i/s7J2Hl0+SN5774Er0lO3roZCzYdJRKnKiCRpA==
X-Received: by 2002:a50:9b18:0:b0:57a:2e93:fe80 with SMTP id 4fb4d7f45d1cf-57cbd66349bmr7978378a12.18.1718717466497;
        Tue, 18 Jun 2024 06:31:06 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce12fsm7774862a12.7.2024.06.18.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:31:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Name the regulators for QCM6490 Fairphone 5 &
 SHIFTphone 8
Date: Tue, 18 Jun 2024 15:30:53 +0200
Message-Id: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA2McWYC/x3MTQ5AMBBA4avIrE3SNv6vIhbFYBKKKSIRd9dYf
 ov3HvAkTB6q6AGhiz2vLkDHEXSTdSMh98FglElUpgvcuyVLSoVC4znbYxV0diFse6NsMeg8TzW
 EeBMa+P7HdfO+H4ZrX0hoAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb@postmarketos.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

As per individual commit messages:

Without explicitly specifying names for the regulators they are named
based on the DeviceTree node name. This results in multiple regulators
with the same name, making debug prints and regulator_summary impossible
to reason about.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Name the regulators
      arm64: dts: qcom: qcm6490-shift-otter: Name the regulators

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   | 35 ++++++++++++++++++++++
 2 files changed, 70 insertions(+)
---
base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
change-id: 20240618-qcm6490-regulator-name-bd20a8f17751

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

