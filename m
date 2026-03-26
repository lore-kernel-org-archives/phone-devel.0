Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30D3BE156
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515764; cv=none; b=TN/9Vc+rdzMjoZtu3tZkxpyArAIaHQ3KeOZnxW8XPCFBxaUNyVmNkn5DChd/GoofHmjMxIKE3cSRqj+xcEsOzCvnKAb1RAKyU2wA81NR0644McYHY6QhQ0HkRVSwTjLGgPb3o3uEJ5GxdAv4Ctzgj7FLesTmY1e6h7bHW6uf8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515764; c=relaxed/simple;
	bh=2KHWGpu/xuKhRMNsbZ5do4ZjTJKLpuahVYj4llNl7RU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BW9b97N9wACik7gy3f5IqVFn5w9qfw7egGV3/vz29+T5qw6P00ZDjlVUKuTizQBSF9P6EArmMIOFYt/PV0jB03kgau24Tvn9zr2MdEdCVKrcHSg//99fpeXljRre3gUr7tCrv67/eP7IiMvMlEQfsQZxchzmZUGRU1uLcA/yBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rLXu/Tc5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLXu/Tc5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fb112c09so7018725e9.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515761; x=1775120561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59XUKTpWPiWuJ0qGTQSg3OcQJUTrCTmU700lEtiKVbk=;
        b=rLXu/Tc5ufaSydxmmYNyeA+oiLE0bXQ/Op3k2kIbEPeBq/XDOXPoLHWNEm9ZHRMOu1
         JfCO/ybtNusflZDI7nV7R1ncih8Qrk5Jpq2nGYTk3FbA0qBfpJ8e1BAD4Tl5QWjcjlOC
         1u/UV3Qlo5jjCezM9TeHMTQyYsmewIj5xwp1Yg5x0k3Cwvkr27h9EDzV97Q4Pp7XMvGF
         gFgGqZ6o2mDHRi7g+EjkEeopVSBZL1OkgP+zv3ijUyh26AyhvkEfu6RlnW305IPrPpqV
         U9+wpYgeyxF2bNDspBhuJt2L5J0LHb8bS3KOpHGLY4ZwlCz9Zq3ASpW9YJDSV4Gg7bvs
         kC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515761; x=1775120561;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59XUKTpWPiWuJ0qGTQSg3OcQJUTrCTmU700lEtiKVbk=;
        b=IqhmXt8rKlRnNEmNc8etGbFauOiQQM4fNnVoaLEzfKZYRzbT+lPasaHN46NxBOkx8W
         fx41UlOA+nbkFWC73G/byUT3/Jj4Bpq54VKVFL2WZpgE2qeI4oSSdThsbAqtLa6ehSKV
         QXJIyiW8Z9v8gVqhnqfFvFkM7xUgBJPl/DA/GRkbLmHbK6YP/pHkx78mcXr3y6P5C4sB
         aFozDI+Jgc+pGido3odrk5sfPyVe9cN1/LN+ss4VRG1ZTWZDM/wRh2wqvETNVelucac5
         RWoesb52E/8jke3cuuQLGelOVFAllYHK1iLIGuz1RE1USSzIrCz+W29e5gz6TxIPJlaa
         zoPA==
X-Forwarded-Encrypted: i=1; AJvYcCUFj2Oqc+0zQjbTMF82ERMfjKXYmK0RCFwOfT6e+x3uSlPtgRbbqN4q06JRnD3vMbOy0rE2L7nmWZW5HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUSEc48/RdHeL18PtCBFnOqZCsFjZgTW3I3dNPF8ed12Jh3kv
	x7st4J84Flb4pkfBgxFhojJ3sY0cv+rG67ud0NHh8qJqqa291+aAJtahCHCqZcF7NVpjiZkzltC
	P6dd4
X-Gm-Gg: ATEYQzyPATzWpEhd5IX1hqbRIbkLdK9KFP94CdxyXWhtQ5+tmpBsz5TR/NDtbgdTkVh
	uQYiaszxuqN5Q4C96dJIC6XFAAFmZzZW7c2ujbKEPa33YEBFeRsJqoloiVIQOganm54O/9YjLSd
	QNpRVEahQAIbHmtL1ztJDDx79+/i41nws8RN6G0wkCo9eWS3FABcUYNN0AzdzoACJoITW29XX83
	OdnB0VyDzLV2Ku3Qj6qFvUXTSFyloQNJdqe/eeuQV3yEiHOY0y4tE8+Z6vaSxAY5laNtwfTn7sE
	U4dZRnhvBNWT75U4sRJAKty1XEJT0CIoQID0wJEQpVgD/H3t+/566dCuSp5wOJDvOLqkxtDytLl
	Buv/KvhxRonqgdyddL3A5AaNTh+0peQnztRQBnkAYKEPcSZJgGJ2vV/DbcU5dsVIoAAOX9uXtw2
	BL8soBcw4PkMdhKL37d0ZjwSLarj2WzST3erdCJlku57LS
X-Received: by 2002:a05:600c:5488:b0:487:2432:f7ed with SMTP id 5b1f17b1804b1-4872432f804mr906285e9.8.1774515761105;
        Thu, 26 Mar 2026 02:02:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Val Packett <val@packett.cool>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
In-Reply-To: <20260217070121.190108-1-val@packett.cool>
References: <20260217070121.190108-1-val@packett.cool>
Subject: Re: (subset) [PATCH 0/4] Add support for hx83102-based Holitech
 HTF065H045 panel
Message-Id: <177451576040.103892.16399746050578598756.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:40 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Tue, 17 Feb 2026 04:00:08 -0300, Val Packett wrote:
> This 720x1600 panel is found in several Motorola/Lenovo smartphones.
> It will be used in the device tree for the Moto G9 Play (sm6115-motorola-guamp).
> Fully tested on it, including brightness adjustment.
> 
> The initialization sequence is based on leaked documentation found online :)
> as the sequence included in downstream Android DTS was near-empty (I think it
> relies on the bootloader to do the bulk of the initialization).
> That documentation is also the source for the exact model number (as it's the
> same vendor, same controller IC, same resolution, and made for Motorola).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: Add Holitech
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c122ddd573a90363d18d5f08aefc48f98b40c3d4
[2/4] dt-bindings: display: panel: Add compatible for Holitech HTF065H045
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/896e7b8c1780734833abaa795fad7eec0cae8125
[3/4] drm/panel: himax-hx83102: Add support for Holitech HTF065H045
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cc72a4734829648465d52484620951199d2ab1e7
[4/4] drm/panel: himax-hx83102: Add support for DSI DCS backlight control
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/987170d0b8da06a399d867c609b5689f3e8dfdb0

-- 
Neil

