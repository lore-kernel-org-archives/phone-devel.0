Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B38420486
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552991; cv=none; b=mPwoc68NgCgsOfGj1XAkECCVJYYDDcJrWA4fwZpK0K4Czqfpf+uCy8qCT8++df0vZK0NJnm7zlM9bnx7owCn0ij9h6xAu0VbTwokte0lLKm3wuNKQDlsJRha55obDSaph/E1a5kqoQRaR6f/pByH0cYHgjvs8SSvnbmcrub6OyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552991; c=relaxed/simple;
	bh=EO92awxn34skIVS7EB9Uq/R0FtNKX5+atpdMK45nbNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pvq56rAoJ7xWnpS216s3ZqnD7IQ0DYcaBn0aInBiMBpzukzw/6lK/ADxDfaKQCR18BJrONaViHqhEiP4ml4PeVpypL2oEQHU2ovDFOPg4oucXDqHjmQM+F5K0q5HJrjNsERnW+5lScxEYlKZhd994jlstAJYtzU9Mc6R1hqqo6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7/DB9m8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7/DB9m8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so16155985e9.1
        for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552988; x=1785157788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+h2Q619dl8wI7WNCJbvozQ6DDMbbno91znOwGOQgLhc=;
        b=g7/DB9m8+0x/t3oStTgu1UyrOD5gnePeaY2p6fKDSwXIZJG6MaRQmmAiJEE6Mn2x5g
         5Nh+ipUGsP8A/Ss0vYKA7yzlYBaXJsynYCrad2i90trqfjZU9kgEVD7yhrwUj0B0ocxv
         GjPBCu8NfAJeu2Z30LxtkCNZTtViQ4Gc9d1il7KTX/xyoyMmnDkfTbbX0Hz7Jhx3gvLv
         b93d3SJSMK1uNjyROajMYNf9wMV43xIYf0j0YyRWf7lNhx0Za0nMGq7mavboUFKx3zP7
         EdbodfPPcztwlY6LdwKHNl1rAL+UHhGlGOuxwQaM97MfAjNLsgbpf9vUxI6Dkf716102
         JbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552988; x=1785157788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+h2Q619dl8wI7WNCJbvozQ6DDMbbno91znOwGOQgLhc=;
        b=bfl1sI1SHP/dN7XNaJmI/TwuHESOlSNvo6/YCLf+dmEa+nzkHOzyCBA93HBA5tjjgA
         9vsdDKFCIfIl0oSCew8eIa+uHrgEcVp6B/JCthg/fKg2WlrxU4BrBa4/PPVEUrJAnCR6
         LIi4PLawIK21JUdnRGy7crna7VajGFqFz7zfhktmhJQHpRHq3cvMna4oTS/Gd+OevdfP
         A8xxOC1DezQlfJW5jNM3SCt1NjTjI093AJAOUGvzcI3ljIhNYEqmXgcD6GRgqs0C8nkj
         t9BMzdga3fNCpB4OYXb374US6r/W8m4GBcgOJ2Q8IaUAjqQgiFxborgYpkoQN9MnNdnG
         YBoQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqeyk3zUK00VlnGCd3wjbX27UvLgXaDOVrWyZsMNPS/dZvV6DSt0B06nHiH3OwcedistR6yHCmjaWhYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyphk7L3KRFI2yOjf0Av5BEzS3ODCtvdrWxDb7VG+Xdc7COEatS
	pUybC0C7xDfBUGfm+/8vKARIpQZhbd5n+aFqTVCmp9z9/gQVTQgdNVqz+t9S+Y9uMiY=
X-Gm-Gg: AfdE7cl+ULOu6geHi9xpxuhvkeC6bMbwPWNp7fm7DyX1HW0q35i3lg/5/83Bh6o1z6l
	Vd0HXn02qDu83fxRnygliXJmHZg+1to7/MAQA8wwpY3U1gM4YQT397MnJHhn3xuxmcFayTkMTi4
	28BtRNvjzWRCuSsTswWaAdWwJvVkbj6OBo2FjhYzVlTMWAM6KCg1NbW5l+DPx6S1DaZhsy1ZFN9
	MPPrSER+oNuelRU7VU61ciQ5pb6+wLK8o394SAOxsmXiHjD+o9hDrrjNTnqujc8A/HufMxwtcE9
	AowXsgwdscDG3zMMAGpBXworJSeLfC1BUtunxs+9BDxMWDb74xqPg5kCsrvQm/2kycU/aDiINAA
	uoeXZThsjeUEef6GfPOAFhmsUEdr4xARIAZ0jD4YXIx5hUMqr7HFmnzrTvDK6rTy7Rd9sYXrT+P
	esGxpP3z/dHGa7SIisQB2YnMc=
X-Received: by 2002:a05:600c:5246:b0:495:6482:9d8c with SMTP id 5b1f17b1804b1-49564829df7mr2659795e9.37.1784552988438;
        Mon, 20 Jul 2026 06:09:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm30767434f8f.24.2026.07.20.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:09:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org,
	=?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: sofef00: Fix DSI transfer errors on backlight update
Date: Mon, 20 Jul 2026 15:09:39 +0200
Message-Id: <178455228137.789946.17345667385294508463.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
References: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 06 Jul 2026 07:18:22 +0200, Cédric Bellegarde wrote:
> Backlight updates via bl_update_status() could be triggered before the
> panel was fully initialized, resulting in failed DCS commands during
> the atomic commit sequence.
> 
> Guard bl_update_status() with a prepared flag to skip backlight updates
> when the panel is not yet ready.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: sofef00: Fix DSI transfer errors on backlight update
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72eb80d9f4e6c0493298bbf782c6a07a24b4e608

-- 
Neil
