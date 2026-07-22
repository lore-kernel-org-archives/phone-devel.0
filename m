Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408E356749
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730498; cv=none; b=qLXQUOPdcjoHYEkZoTVW6IV8OXlfT84Gc7ez5rtwZgn97T9Us+cYqVE+MLJtTMZvFzlfMJeaifMW7IAgPmeMqQFryJs5yz04HtvBUMYy6Z4nBzg63CjKvgh6ezlf21gL8PD7hKAjxo/PAcCrQdoqxLwigNorxV30slZ+F3kNStA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730498; c=relaxed/simple;
	bh=IafAHFR+mczSlQCMQ46vM39ONLwjM4z3ixwRJC7JS50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRBaC25WZr4RngvhG0PJmEl4x1oCA+pwbCXZeAP5bUjKDRWhOz+kegTxRAfN1/u919c2NZiRe8GnII7FnIwZ3+HLwDU3KZ2fMEQinasttLo8AscVSjcLC5Lq46wKih88V33DgG2xtuA/c7g/oBdrExDGdmHNvTOepI3qlhEL3mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTZgzuJ7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTZgzuJ7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476a130c138so9109815f8f.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784730494; x=1785335294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyxwzSpvGQN879gUQIzhLBDWPp/ka/KsPTZu5mIF37Q=;
        b=TTZgzuJ7hqXgVgcunwaY3K8xpHqusYaaRhf9EEyz4Xj7RZjFMApCZ7ZKHSt1OY1UP4
         rvUghe1AzmHvwP7c27ECyKOqFUlLeHN6hkurE+Z6H2/3OTZHFMftGj8Ae5zV8fFknCM5
         gCnqOWCfLuY3QIwsF8xHjXAp78yiKgJV4scoJF16HEb8rVdtZ2thJ7NF5z2Y4Ac+wmsi
         VmRb2hIFkD4d2jVHaBLfGs0M0yK7KA7natJjJQsYV8+nHXvNoDAQu+lf67/fIOIcm5ed
         v/s7nVFgq9j82yZ66hSpbD/qB9ovphOXWW3vxa84hMB7zhigriOmnGWg6ARW3tP2jRiy
         +8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730494; x=1785335294;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyxwzSpvGQN879gUQIzhLBDWPp/ka/KsPTZu5mIF37Q=;
        b=n/h3WfvyXEj8gdfXrC6+9Iy0Xb6h/2KAZP0zTxpHcTdFdnFTIi6wXLhzsKX/n67D32
         uwghIzCEutrz1MNBZXcEjirdB461njzfaLs9zNvKP1/E2DmercwsBIEmDUolnFqe0Edl
         scLrkTvyqfUy088kTa7KoEOXkSsVsrspHRjCuclhzpIM0zY2eLoQ5vuZG4iJoZHTmCAv
         xzOXUtEbHrrR3iVpF5n8JbJ3o1sgEFVaZV2WxOumI1Oc4bozQEArhsVComHOUWKTopH2
         WRfvDYvtTalr+xoP/hakFMVpWQ1TZZ74wuRYT99sYjOKK4uc3GF9zRv3O5uIvczlD9e6
         BW9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Mx699ITfyDwI/SD1p7opyk1aHlI0pBJd73ug2R8HrUoHTE+Bsx9+h3+BBoAHTTDA3+lzn7VkBwskXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4DM/FYTXoR+l3ZjP926zmxbT2uhSDgr9bPGwQIlM4Jrc40C3l
	O/HxyX/+mjkN2JkArGR7qG6S475pDGUryyq3id+oUzzy8cNNDdktnUGU7E8a/Pm/FXQ=
X-Gm-Gg: AR+sD13Fc+KSNnGnpHxpVPk5wb+yDQ3M7cSwuN+B4asREB0zRkymdusdaHH+6h/TU7x
	Zs+WU2YIUmcAtQPv4buZVvP/yN+j4QjLvINBYdSbQJUXY7Cm7hj49suobGDwglMdUvBhWGByZvr
	xqmhL13q2MOhxniBmpVr2unW3l73p5GHpg7BA8N4ggVt83QNDVsAPrtA4n69cSsP8bp/0csRHSD
	JTBrAmZylxtMFN1a9q6SYbuz9w4D5ou+X00nGizhZvTNViVCBi6ehmd05VDOgYcaWsASw7iOgdK
	3cxI1QoEzmmhfYMqswkJkZqN9CKIx+w5tkQ2/znj4tdAFtb9Z0RuLomdYKytvdlwv8BToR5G4mT
	d6yjKub5HTD06aZKoUmZ6BH4hEcKEAdY2K08Nyeidw2JEZFUPsQZVAiVTg+95N3mSVmBhGl/Drq
	8qqgnwF4hIJSbEqd/ApPfXCGM=
X-Received: by 2002:a05:6000:22c4:b0:47f:81a9:3f36 with SMTP id ffacd0b85a97d-47f81a93fb8mr8233483f8f.18.1784730494276;
        Wed, 22 Jul 2026 07:28:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm7095263f8f.7.2026.07.22.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:28:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
In-Reply-To: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
References: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
Subject: Re: [PATCH] drm/panel: sofef00: Fix DSI transfer errors on
 backlight update
Message-Id: <178473049362.1948896.1910557231918245349.b4-ty@b4>
Date: Wed, 22 Jul 2026 16:28:13 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.1

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
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3367c5a129f74812806034fa0a106a1c3e4a3890

-- 
Neil

