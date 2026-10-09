Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E24CDDE7
	for <phone-devel@vger.kernel.org>; Fri,  9 Oct 2026 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545119; cv=none; b=JpzeC2tvfkOWuluXItE8oDgkVUBUS6E62uyx3D5Gj2rMOlxxggkphyU+hg02U1ox9uJBs9C8mIVQmMkhgI1bqk27lL3LGEToKufbGz4G224gK0A1BWmhI2Ks0vP/BEoRQ/N9T1amP9S0NKdlVFjrCr7WimlUBKHC7aaUdbp1mjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545119; c=relaxed/simple;
	bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKnfgaviGhS4zA/xJHuS7z2rIHPWHO9MfVMREzRYXyBZA4x+Ao/xxrQCXd2KcX4lZCPOHxKWeLG3ZeYyQwp8gCJn+v8Uv5Es6l64kA+XBKzaWlbTZX8Qz5ws08UEyWPhqt1lYcp25jDZTeBLanJkWVN2s/2lwTqp3af63H/l3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uQDmbYME; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uQDmbYME"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a9e5ba741aso5985531a12.3
        for <phone-devel@vger.kernel.org>; Fri, 09 Oct 2026 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545109; x=1792149909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=uQDmbYMEU7KJd5um3qYuideomb4P60KzbzDnJfX4B594Co19Jj9F5nsokp9I5JoRHC
         MDKHBHRtKS9801fG+wEC6jZAVRUL4J6PyJEocYRgel76iCtY1Htp4d4yREGsj1KIv5sH
         rs6E5Ke1f0Xefw7x0Y1traXYA5uCVkyPQVMUTQlWZ7H/BkFBpeK3kjL4FRQGzmFMjPQn
         LmQs09cx7Uoeph5nZhTLPgCCxzgZ+ji30+1a55KcWKJRR3qVXWinku7JfySUzsykl+na
         8Jqmtx+r1zacazmfTtfBnzJ/SeYL+6JtIYpGtFxkFOHMv1onDHAKp7D+yK2NLB9ExHhI
         pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545109; x=1792149909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=ViMjWesvjPH4rtmEZb3LlhVyb3u2vgKjHAMxpOwPelVnDGO9aH4OCH8bE4QLmPgB3i
         vg1es7Y9MTNrSXUi0diGsal/rnM7X9NdeffjDuvJtgxy6Uv5zJhpcP2f9rzoX956sMe+
         fvjU7O9NNQJYHRDXEE7b62q8hcdUI9mV9kj/I7xy8dXSx2z2Lxvipd/H0Lu2rfKwK8R4
         ScECk+gdqZeEDKcwwqID6m+D2YuL6SN+0EKNFpVKbtij/P1dxkcbsHcG9Nk1xIJvwba4
         qdR6C/kfxn3OFtOMOb1inuy/uaaaHRRv/kXAOa/eF5etn2ZsuQPPk1ILqYhrdmsA0e8U
         O43A==
X-Forwarded-Encrypted: i=1; AKwUvBxTCOFJpmyP1aDVUWEoSZqNtbsHxcNGNNC5OoZZVEgfWFXYIi1BXXvjlq4NaVMQutXjMqTenAHNgY06wg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjk25GU0xN3qR1RcaZWwTCtLL6FNONdJTPdp9gLJhpyO41TrXg
	i8s+tRr4AaFX0j5KEUyPllYnkoRfVrXtcUhpRzgOE/xFTf5c8n7c/oQpoTC3itxUUNo=
X-Gm-Gg: AYBFou1JG1XsDmf7q44cbdai/FsYjliRwBLyNR++FDagkp44bC0AvsGRJsxyTVh1hzO
	om4kWn3bG/k433/NjJHXaKm6irACOmShsigBqKYyCOV5pPID64SMqG/ReF9UaEDdl/VRmpY/WcK
	o95NBJ7/H5wQF7lfeNW1lwNQWB8ypuH+U3tgzdkknufHkkwvBZy9T1jYgfKy6j7QTEJJ8vuBZlU
	JqEma76DRrENuLZzqEwjb1EaKgGMgmXb9aFD2kGaimG+uL/a4alvmVEMwBtwvzdhPy/jHpPh8B/
	SZ2A32CQ5K146mXnLjhwB4vfsUZIIygr1wRdNxJa5+u0Ssuv/2yf76izjchE4SvAFT3g+Axwm+d
	6fpfV6GnTSKAipnIpOyUzJH8g3uBM/hGPuGOOEoRmtQ70o6oFUz9/5M7c0vVMnoH2vyYYEa3Lam
	FHiYWLSYwq/bBi4taSLs2hy4CQE0EAqcDfM6Y/EnpE7j8pvM5AGnXxUJlMfnisIDSj1Fd/SknhR
	q+VOLgQPrGtlD0ycY03FHox7N2yxITMznfRGo/grpBq5XZGF2G0
X-Received: by 2002:a05:6402:274c:b0:6aa:e3f3:c9df with SMTP id 4fb4d7f45d1cf-6b17c252c9amr1447419a12.20.1791545108898;
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:02 +0200
Subject: [PATCH v4 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-3-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
 b=zcZTLYpESs6HkFuhiJJO4ex7iS3OKoMwbYeYOixjFkTwhHKF6/mXLg00Wm2n2nZuJbFx10Srw
 hzYG+p/eC5fClyEBuI4SYS1ZuYA1CMxxotWYaEVsc48KMcsuoKB/Vpe
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.56.0

