Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA4242D7B
	for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722538; cv=none; b=bfLn6LoWMm8gW9/OWRiI9o5cYcCZ+3Meoei+41GwKYQnE9Q/GcaYnnXkMJiERNK0YjjvH7ZDwI1mwbjYuhvSsPxbMMIUIPINymuX7c2N67YaL6FvUbWVKHiWN7A9UZEjIJSkW9+1NduSU24AQY7IYyt6dNdMP+Tf+pj8pe8r0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722538; c=relaxed/simple;
	bh=IafAHFR+mczSlQCMQ46vM39ONLwjM4z3ixwRJC7JS50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=inZ64XOZYbDUxWTqf9bZVct11zVqUBVfreSyP9DFXbtIrtwDEWW38KoqSF7CRDZyvsQHzNWcGMaJeAVzr/1pub8GtKUkNidnZ+Q6lA5mKzLIXMLbovkUR3EtZGtUiqt0LhBpSb9/OAZdZK6kOIBt4AaRdhJ46OGUaWqrwt/Fj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIDG/iSe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIDG/iSe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso26482885e9.2
        for <phone-devel@vger.kernel.org>; Wed, 22 Jul 2026 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784722535; x=1785327335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lyxwzSpvGQN879gUQIzhLBDWPp/ka/KsPTZu5mIF37Q=;
        b=iIDG/iSejML3KVd/KlqCpZ5sOJoR8VifHO+YxUD1WY7Q8o54y6Qihc7IyD1ZeXFj/P
         yDZVRZraBawJFW04nM+j/7gCP8UvrCb3Yvpq1mTMZ2o8vmawxptaaGH9cj3lZqfb96qs
         vaHfLxAYY8PCQT0UwaX+Qdo3fFPyxJT7gRvjZJ6yCgMuyFdsHhH2O/OsG+bQ9zeeP8bE
         hRbtRMHFrGqoX73P2/yamSXtcNr9zK31THzmx60uISsMGXuTRrW+h9NP6L9g/4K5/CrB
         bkqITGPpHouCzj5559lOhyrDrCNKIXc/2TyJUP0bBmoqk7FaIVn+jINYXan5THTWdXRq
         B8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722535; x=1785327335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyxwzSpvGQN879gUQIzhLBDWPp/ka/KsPTZu5mIF37Q=;
        b=XNlyHzXCGTowuJVdIiu3g37sOmun4IZjfzl+44Xh21jdWm3Eqqg2OiWRvYNCerE7Km
         RKBz15Jg5SJdNazEK3MDsLYIt3CM23hB9gtkDkgmy/t5LCkMg5zzFVKJ1Qv7FKBgXm9a
         E/ietlxqwjk7RIkqWBmv30PGPfNbUmvgjRHrfzkva6CU+TQUVPGykND4Q3oGqVPLqI9O
         B+bkN0JTCHYSoH72S42VjRdiSvpXbeqlwgiBzEYygCSybShKiRHWaTokasjHQ+173Dm6
         ijBXhbINPqOgazUqWvzkKPBsZgH0TAl0Cgv/s8Bft5Zquc3xGdDrOoV166XKp1TtGo8d
         EQJw==
X-Forwarded-Encrypted: i=1; AHgh+RoqiclLoVsjkpe2I5gfWvL0ufWx0rx8/Wmzh5QG0Vyso9xc7u1xAnIEzfjDX3PkXcYbSGvoNPW1+V1GEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGY4Mfczk+f0loOA2wMp2VbnYZYpotqcmsZgnIA1jlaukpYyMk
	T7qK7PR2URCFbYWybv1xnGyx7MS2n6zl6XkQfMWClyrkzGqOc9OZEIc6kMUp/Fni70BU79DrpNU
	iDAq4
X-Gm-Gg: AR+sD12EcSO5BSk56IUw4GZcrSYalawBWo60mlr6e8wLAEyCScpzM/xEAztzrX2pzUD
	lqd8d+Zu0wfE6yyh1dSWNW85eDWWqzbpDqx/098lw/4l4JkNMFUu4asEhcS0Fba0/kSuh7wkrow
	zck3TdWX1nmuhkbmsvPEu6ANKvdA5pl64WyvZE3GbJ8mtId5VEUQvYXXTDTYtKXAifNKOstKYlK
	EAa1LFrrr7oRWkyI8G7ezFgfAA1SXrmIIKccoXShotN3C9hzhY+6aM2OU+TIZD6FYKwmBJZnod+
	hP8mUG1PZeUDHeciwTtqWcBsORXpJ8kNI0X3czOo2WKO7UUhH8/7fz370fhxzYx4IzmiyeUTD/T
	4qzktMkb08d9ofE1uBF/McbJU0/qso6Z6h2Ui7B4CDFJqEhh0cGc6QbCSvGt4pVdBu7EylILQrO
	C2plTgCdSKPK1zsztgw55aGo8=
X-Received: by 2002:a05:6000:40c7:b0:47d:fc45:8587 with SMTP id ffacd0b85a97d-47f622c6242mr27265527f8f.0.1784722535151;
        Wed, 22 Jul 2026 05:15:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8635c8d7sm4379093f8f.21.2026.07.22.05.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:15:34 -0700 (PDT)
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
Date: Wed, 22 Jul 2026 14:15:12 +0200
Message-Id: <178472247748.1745070.2574676962239424273.b4-ty@b4>
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
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3367c5a129f74812806034fa0a106a1c3e4a3890

-- 
Neil
