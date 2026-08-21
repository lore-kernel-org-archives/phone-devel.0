Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F1380FE5
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296351; cv=none; b=UQzyNOQfWzniKjTKYkyclI8j6cZFNHsrKAkRWnDD5OjpvzJpj/ShS4UJfBKpif0wbTmHat6yg8xm2grZJovl/nDFp/4Y1EL50XYx9+Q6b71TYFr1PJ8KT+b6KlbViRpafYdYnSGaIH8mWovBD0WtzWz/YIviShXyP+MTxgHUrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296351; c=relaxed/simple;
	bh=wAYifBw4LrLjWPQLRl35hYzVyfpBjeQp/AkgYLUI3gY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/sIFDNm10HPl8Mjpv1VCZe2aS+9dCzKwH1o6X/SE3+JjJTMTLTPa7q3H4NZNKEg3KTdIOdPwjaOeOqyYuaZuAix4ZP0INUzAwguEO5UR0yK/GFX9BlQiY1v6UtuYpBV8ohuAKpXslVuqIVxOBnmT8Na2km94+5xtnnTV+mQB3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cSr8OuX4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cSr8OuX4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c160420289bso100494466b.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296347; x=1787901147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=703iFda3ZiAtYyhVCmZdIqpRPYpgiDOlfHNwV7wXBo8=;
        b=cSr8OuX4SYAKIfwZjMCNZcGmlCXn8/2Obb+O+5IYJRiYexEbIpZG2F0zo3d9TCL6fK
         cJIGJcXFxCEB4tCOnLW3ThmHmXR8PWfsnQckM5m7Plq31noysQrF1BjPNpeTri2IiLb8
         bNDXHfPaDNU/qpKbR6axlCLJpvFx23Dc9DIQ4533mFuqJDLN0nZLBp1ETqAELNl8MbTY
         uTbpwmzL1B9bgka3qy+8ppHzDhYCMuDATwu18WcfKH+rSDvYhOnfptVqoEyB/jzTSvwL
         x4PLHxlYEg9wU+n/gK9b5juhjvMMD+5mEVU2cfThS9V5TGV7ZrTQpnDAv55yu0/i8Ag/
         gchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296347; x=1787901147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=703iFda3ZiAtYyhVCmZdIqpRPYpgiDOlfHNwV7wXBo8=;
        b=Gs1BxS7dfUOg/m506XmKsqOW4T3Eq0jSe4oNZACur0FxkOq8pmK38cHC7PGxKfpZAe
         4WYz586bvifbzSKeECXIBXw/yLQIwHqx7pVt86I0I/EO4TPw7CVmJihVivVNDa4OGWEh
         v2rHABbXf74snZLvqYoghF90/+orA/+ff0bjlV4Anh/CsJGYwlooLkxIbAxci4K8d69A
         Q5UnN+RXNrO3xeHNVFrIn8M+bWDMxuKveE9RAbXH4dmynCKyox25PVBtoIaYWLRxVFVs
         uax3ZaX3aAP/DfSxg6xgRR/xb3/BrNmqguIPxXi8mCdbiUTAHOqZw0vzuD2zqanByfre
         t3Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/h5sJdgf1+yRT+T7+RG56j4fKXSWprF3r6gFyd5tdv7sWey/rxMXNoMUaHyEAaJJGUQfoK4HPqwBc1g==@vger.kernel.org
X-Gm-Message-State: AFuF++kSQ/269aym/0ewXx+ZFt0KYUzgktAQDwPtE00bauimlRD2OFuS
	gtkoYvI6P+VeCRb9Up42sYY5RxizYmIn3ppZDIUupYdyjn/n/YmOk7xWqC92UYGcgaQ=
X-Gm-Gg: AR+sD13kf/ZJz5BzYAc2tNYHbt1HbQpwicC6KoELuZvFjvme5Es8SuGXnKqvAoWDOgF
	PD2o4D2cmLUhA892PjRTm8cbCbAEUR3sjdWqskrxlhQX/BY8PbiBiOeS/8XsiV+wdenBkuG5cYZ
	LATNVQI2stLogAhV4wWb80C/I9yCaZ16TkkNOIyXpWLx/jH6jIRXH59r9bbFjTBHgQ2s+FHvqCl
	dPNf3gqfI+YssMBIYF1jpNQA78iXn6rqvWOxBlG2OcTSjwG1x9E9Ht3qmSlj/VL3/DZV/rgGU6V
	exX/BdHA9VT97F3HCUFXFu6VxJ2Lt13qCwyDCFl+Kfhnw1Yj+u5Dp6t1hIYkxK198jtV5PGMgv2
	XGpdjHPXEMQpFIs744k4fd82fhtFlzZwYr/vSdO6j5imsn/smkcxteUtNnR5rUgMHIGoj72SJxp
	l37YnmKi62OBRX8nzO2eZLVkaVBcsmkJ9LM44AMOeFyiKwMFNEYkXINgUQgawD2o54roCwrLYyy
	caD+oYwvNyzAd/vmH18I1MoT7rxprf8F1KdIwyMAyg+jXRRggqATQ==
X-Received: by 2002:a17:907:ea8b:b0:c21:2c32:e2da with SMTP id a640c23a62f3a-c246a5f4515mr470788666b.8.1787296346819;
        Fri, 21 Aug 2026 00:12:26 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add Himax HX83112A support for Fairphone 4 touchscreen
Date: Fri, 21 Aug 2026 09:12:17 +0200
Message-Id: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wqDMBBEfyXsc7ckUWzqrxQfknStW/DSJIog/
 nvT6tNwYObMBpECU4RabBBo4cjjkEFdBPjODi9CfmYGLXUljZbYTiV2qymU0hZdQao06m5zQJ5
 MgVpe/7pHc3Cc3Zt8+jnORqDPnH/SUQNnI6Ef+55TLZbbVUOz71/IQm0+mAAAAA==
X-Change-ID: 20260820-fp4-hx83112a-b3e14819ae14
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=797;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wAYifBw4LrLjWPQLRl35hYzVyfpBjeQp/AkgYLUI3gY=;
 b=2Dj0qb8NpRFvmLKwoYP/zkmS6yTYwg+eM5kiBlrtWmCLDfScI7wglxoxFsEke4uECD4sUI0BF
 eFHZvO/aQUsDuuNZzHcfBJmTSXU84048+NdR6JfrehzNS9Ya3cqXdiL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings, driver modifications and dts additions to support the
touchscreen on the Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: touchscreen: trivial-touch: Add Himax HX83112A
      Input: himax_hx83112b - Add HX83112A support
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable touchscreen

 .../bindings/input/touchscreen/trivial-touch.yaml  |  2 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 21 +++++++++-
 drivers/input/touchscreen/himax_hx83112b.c         | 46 ++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260820-fp4-hx83112a-b3e14819ae14

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

