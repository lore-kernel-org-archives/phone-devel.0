Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6A1C3C00
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896111; cv=none; b=pteAwHXnjKa9m9h1xDpDrcX+BNDRIzcEbLFqWPaof4HVxgskaEx9GybPWkfuiJnfai495SWqcKzuvdgnbq9z2JgVB1H6AsxctXb3tBtq5pgQSXyDOr0MZubzMhTpWtjrq0dV8zovcFigeuhgmju0i7HFYI8AyOB5db2VlkAppDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896111; c=relaxed/simple;
	bh=dgmlLrpBpnhcVRatzmA3ElIe9dEfB/vT6wgPvY7RCLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KKP9qn95Xafqg9o8Dm885KHIkEnaONSQqEvMjwP7sTK8ob9Vdb69whGtceNklJUbN77l3hqa8FwK7tulmlEJ4e8NBOENlVnV37l8I50nWqYAkLIfP5+T+UE8EYt22DMPXuolgkxq6/kBpP/Xhy01YYUb5kVvRXSNUkSzYuxNkTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aswxTjXG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aswxTjXG"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so17989398a12.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735896103; x=1736500903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kNqfgWGfkfVt/bxXFgxNqi23umuLOBb02EY+IZ1jc4=;
        b=aswxTjXGLxzjoLMW5SHu4fVmkMiVljtM3OkwajI5EQlnP0VHdW6LqcvIHGjrVt3s0/
         BhfS3eQjR3H06pVAQasQFRkn36pYZ9uspuxqMcZbVN3ShbPYcmVUuLSDyiFEOR+oeMPy
         zYTXJ2KHNW5ttMK0GG15UwyafN4h9hZG/n3q4gBHQSn6bi8NPQNT8FLNdEh+17yG9qVW
         /GATNzZ9O2iDHkhykVKyByUWrE0AMRez56K8uHzEhgcc08xmNxs2z4iq7J32M5uq0YGG
         xERD9oFS1cpRD0mFG214oBYEVlAwXPC8m4ZUykljDKJM+R1hw/cYHRHEqEkd6tInImDo
         mLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896103; x=1736500903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kNqfgWGfkfVt/bxXFgxNqi23umuLOBb02EY+IZ1jc4=;
        b=hx150Qd8ZbdOnCATxKP49wcgN3sRbC+hzsETfj9PXlG+wzeVRfGnqJdkuuhXz93mWI
         RqMUpff8CsHrjNglBBgyF7khQvLNs1ke7RpI8QR23m8OeX0jtOn7jbBHdX1pyR4tdPs3
         NolQQ4I9xofh0pN7iEEvOKe6PcMpdwJdzLw/eoMCR0acA63JNbjPPmEgIANtp3M5bJah
         AxIcGLMnhfl1KyAIRoLWJicm2k809ey4orIyEWMHCPQjn6GaIt4Nz3KlUevg7ih2Y0FG
         mTCpiz25EpWrVukVbFi/l0urPs78ohxdEfBE6h5Lywvr5C6kOoRpq+hiTRlwyBlYk8sm
         wTog==
X-Forwarded-Encrypted: i=1; AJvYcCXPCwF0iTGqtCftkXUQ29odSz+GrRrBdJfCinnwv0uBBfsbqUcwimGj0CGXBcqoA8mIka1butJIAwI10g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzF1L/cVpaBfcFcS+krmqLiJ53yPMdQfrMat49HPuikVYOjMrP
	FVCXmAM9oA12t4G4uxq9Ti9W4zPqQ24F8DVlJKPeTQRsXRUtH9dUXEezJg/9igMv7da96uDYIBt
	z
X-Gm-Gg: ASbGnct64oGNXX6DcNe2s0uTILpj0Suke1MQcrHqF6nJhFyBSZ74ESx1N1t123IQ+Tv
	CAObry5etfyXE8hFbUtElLezUavCn/fh7vfs0+B8/eGb2+ZDgIad8R7GYA5or8a7m6smvmr4kVP
	k2GqfnYjEqpRz3BdkToEPpajdcN6EDmoY2+6/aNZaba6E5n311oy0DnSLfznn9ZJI6FM9CfyKH+
	YfdJQ+J3PLhY+A75Iib3k2qNaHB6yMdNoaDNvvC9uXwX3IgSgy09zNKA/aXEdOg4v/P02ZVKlng
	ozc3nMOZiMVCT0JEH0IoBuiX5w==
X-Google-Smtp-Source: AGHT+IGu1+xTSi3G3Zc/mqzPzvlJdEDQOTlLhsMMlE3lvBvhvdWDIBE8fThcf6LjLSwmrDncRUMvXA==
X-Received: by 2002:a05:6402:3581:b0:5d3:bc1d:e56d with SMTP id 4fb4d7f45d1cf-5d81de086afmr41880660a12.31.1735896101632;
        Fri, 03 Jan 2025 01:21:41 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19235306a12.42.2025.01.03.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:21:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Some fixes for Goodix Berlin touchscreen driver
Date: Fri, 03 Jan 2025 10:21:34 +0100
Message-Id: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6sd2cC/x3LQQqAIBBA0avErBsYi5K6SrQwHW0gNBQiiO6et
 Hx8/gOFs3CBuXkg8yVFUqxQbQN2NzEwiquGjrqBFPUYUnJy48b5kIhebi5IXuvRTWSN0VDPM/M
 f6ris7/sBxta0DWUAAAA=
X-Change-ID: 20250103-goodix-berlin-fixes-0f776d90caa7
To: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jeff LaBundy <jeff@labundy.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Charles Wang <charles.goodix@gmail.com>, Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

One is a simple comment fix, and the second one fixes a discrepancy
between dt-bindings and driver, aligning the driver to match
dt-bindings.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      Input: goodix-berlin - fix comment referencing wrong regulator
      Input: goodix-berlin - fix vddio regulator references

 drivers/input/touchscreen/goodix_berlin_core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250103-goodix-berlin-fixes-0f776d90caa7

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

