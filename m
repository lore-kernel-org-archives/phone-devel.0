Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1534C54676
	for <phone-devel@vger.kernel.org>; Thu, 28 Mar 2024 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711612974; cv=none; b=cUzb5uRfBTNd4U6HcPplDlNcvqX6Y8uPay7w9tZJsgcJgxNxtdOukp78vqxp1rsSUtTsiJi1OFnhtCM0Vfr6MLcK7KPf5VOSYhjiDaBhtIsqVRDUiYm+PgXtOigfb3dsZxhdIDAMupF7vQfNWK3BP566Yvyk9qg3LdXEdsMS2ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711612974; c=relaxed/simple;
	bh=nGY94ctV99RKSBmKBzu+ogs72YCJk1Ocz9yUA3kt8vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pjmjy3IEC3EVCuzkHP8zxjuH0TSjCI7waB6pJMnSggkrecig56g3kScCRfK112+lFJo3VQw1DVHwd9iMDK3PoU6K9cnb4u0MD8h1be/6NUVVHB+UtTEZYnUB5S/SG43DrJFH/0z1alez1XBENnO+SuU/RRsdtv3FYrW+qhyPbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NGK7V3cu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NGK7V3cu"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c50e8f578so601242a12.1
        for <phone-devel@vger.kernel.org>; Thu, 28 Mar 2024 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711612969; x=1712217769; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5mODnViOF43Qf7BlbaL1yV7bCzvxW2J00s0tf+KV++c=;
        b=NGK7V3cu1N3eCHO7pKGFeXE2/+iBgqPFGDgdQHHmx9BOhZz7y41ZMJIJEPQhTZYbRH
         aGU9jhn4IYYGh/5fR2hkxRweWs03Qk0gRc97LwvRbYaAOpdqsb8lkM2q4N3bqxd/WVPf
         JuRBPRxS7R2dptVwHCjhBTskzfOI3+W6csCnal4lfGGGgzcON7vjP6rzcq8utYFcKSwD
         x9BezZo0owHo9f37QG+wlMIz9RAP0Ls7jslqr3xgwxBXVq8lr5b/0cJyJMrx4DcngDgh
         j9HXbxo0L+PuJCbv31raxkLLQd8m7/ZQbUadMdWxMW5qvkFcTvBr2kjJ3GuP26fFpIni
         ZspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711612969; x=1712217769;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mODnViOF43Qf7BlbaL1yV7bCzvxW2J00s0tf+KV++c=;
        b=Nx4opu4bh9HNOfDfYAJf87boqyQOW/DkEypplnacSKhHvq+X/bPV/Nfa6LGF0u7jrt
         6fFE2r6L1opksV4UUtaM2mG4lSH9Gd8yZT73IVl73D7z8d4rfiBxAu/V6q/oJYyKcAlF
         qH6mjQcxcEqeCe6TZG09EtDMe8MhJ5abE3zFHl9oTkfjBHkP0Jw3sBTCEMC2PNkrl58T
         O/amYUSCT3+tetzZH6zgYCafWggiPeW6RjI34dKw9a0fVQr/vW5kmonZZrJfswEwJDem
         S6crQ71BxMucvlqyo3w+LIY3ozwOMGLgw69yIVeBlqketxnyGK6JnqN/EAIGaY4lfE/L
         a6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS4CWqYKJQ4+xjkbyrnwpDtBeH4uzRbMaj+DCNcpiNlfy8gnxPNqWZ3KfE22fwVtyNV/edoSr49BFHY86lTFcuegNCIOJSPxL3+RE=
X-Gm-Message-State: AOJu0Yzm7T8Jf8uNfv90mNc3mdhj0GQ895jR7IE8y0dtmDoQ8yscV7EC
	mIwiSfU+PFhXr3lCtbF7IupbSjrt6jX+2cUoaimx/2iOzksnvVwayLqEIBVdiwZ+rMNNQB2TFwZ
	k
X-Google-Smtp-Source: AGHT+IGvGtijoBb4YavjO3REnAE+9JEFT1LLiQTDvEwJxSta1iXIKu06X+xRwMugSsM6ImuZbjFbHw==
X-Received: by 2002:a50:9519:0:b0:568:a226:6685 with SMTP id u25-20020a509519000000b00568a2266685mr1455890eda.8.1711612968600;
        Thu, 28 Mar 2024 01:02:48 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id k7-20020aa7c047000000b0056c443ce781sm522618edo.85.2024.03.28.01.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 01:02:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 28 Mar 2024 09:02:45 +0100
Subject: [PATCH] drm/msm/adreno: Set highest_bank_bit for A619
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-a619-hbb-v1-1-cd135e2d22a7@fairphone.com>
X-B4-Tracking: v=1; b=H4sIACUkBWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyML3UQzQ0vdjKQk3UTjJLOklETLVJNEcyWg8oKi1LTMCrBR0bG1tQC
 NjGDnWgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

The default highest_bank_bit of 15 didn't seem to cause issues so far
but downstream defines it to be 14. But similar to [0] leaving it on 14
(or 15 for that matter) causes some corruption issues with some
resolutions with DisplayPort, like 1920x1200.

So set it to 13 for now so that there's no screen corruption.

[0] commit 6a0dbcd20ef2 ("drm/msm/a6xx: set highest_bank_bit to 13 for a610")

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
@Akhil: Dmitry & Abhinav said I should ping you specifically to take a
look if you have an idea why HBB=13 works but HBB=14 causes issues.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0674aca0f8a3..cf0b1de1c071 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1377,6 +1377,10 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a618(gpu))
 		gpu->ubwc_config.highest_bank_bit = 14;
 
+	if (adreno_is_a619(gpu))
+		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
+		gpu->ubwc_config.highest_bank_bit = 13;
+
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;
 

---
base-commit: d5a436a7b5958caa6fc0dcda6c842f9d951be73b
change-id: 20240328-a619-hbb-a3b6bda9e4a7

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

