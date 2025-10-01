Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9674E1C28E
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302938; cv=none; b=mi6dhQwnKPKK6RCxAqe5XjBR4VtymPlfAA5INZhnynMBLFyu0uupo5zo0HoLJ98VpDZOPEM5/HpMvGV4tsiTSi7Oe4V+5JchAKSSOQYkGhZ6tE/0QaJWfT8G247wauNgAPj3k8PQAgbNZmSXRBMhXdPbV+/L0gwAumAqIiZROO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302938; c=relaxed/simple;
	bh=kF2U7Nwwffvx2Uw/H6A0ckJAmT9g0NCqwMG0nstmLBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q+NHY998poH+lHnwkPSukHitru+EwRoaZ0UjlMneztWZSbHumulPS2z8WqILoo+3A16wWsmfMTuXNVkCQST9qcPccdn7XGS2j/mK8iGkhugVPbK7Dde6LcJsZ+W9JCw6/O7+SeYjUTY06DujZsRcl+imjrqO4PLZOCBa2DKMrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcaA0GL4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcaA0GL4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so22607625e9.2
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302935; x=1759907735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig8BKEaSDbO0ANR6SUqa4XKNjpsfwaNlIByEpPqVvbU=;
        b=rcaA0GL4c3S2t0ZIB9wU570W+271vZjhyrJsiq2rLwARJAVsYM9AWg7z/Kqi8+dFYX
         s2PIryy9mvj6iv3iq9ghr+92BL8SQPxUCnrbLNaXKdBDcb5aeD9XitGkjWFAJcWxI+ql
         E8nTzSjNWmJGBEHLLckmnU9dbhK+OsQNN3Y034vizKssLr/QlTrcTaPwAcJRAeZ0wPkJ
         6BWTJs0gv/4BVU4EXga/Nsk4HRI8kVWIj3E/r2cv9KaF7lT0bOOMF0gSt2sIx5LD1Oje
         LX7UZBCZ6zfkbZifxQp5kyAUgo72ujXF+ORJn1Hx/ECRwK4b4Oj0RE8DCZBEfXAULjuC
         nc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302935; x=1759907735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ig8BKEaSDbO0ANR6SUqa4XKNjpsfwaNlIByEpPqVvbU=;
        b=B+19oU45807uxE5QGmuUfUtb37cx7g5eBI0wCps5LvQmIA8Ta1euTnIIrWPJAcvi7j
         XCVpLBcfuk2PRbu8wOqpIszSimlmW5GtWYa5QF9AhN+pvz0oB8Q0DiAj9iY6qGTN0AZW
         9SNoNu/BdxNzc1U/At2zpkUOeuLHI6K750bd2k4FRJgICgtAs+KVx5tz8CILcvNF+eKd
         l2sgX4Vt1s8fAi+MuvlAtgOA2Lx7KObmPXwS7MrsaEz4ovniz86WtXAs7DF16JaSvdwi
         v5KtI1pbMaQy6e38JX79Zf1cpuSIdnSm6R4fdhGa5XdtWhHVUU7misRp85rI9LEogNgw
         V9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfvSiKlijg31q3JlWi0dspzzmekjwXEaB68VEQ4wPrK8BN0GDwPCvrtcBkxcf9HdhKcQGbn5IhYVnKfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsmBsCeQB26duQ1b8lFccLK2L7Zg07q2RL1MTBcUVDM8e8ALJn
	LNRCZpdrYxErjrr9j2hKdRIL73sgpqDt6ohVY4/0UoZPHPsoD3n8yIlf6op8BnKHrPA=
X-Gm-Gg: ASbGnctFFlTIqNrXCsCZFZrSIBW4Akhpo5yNOddDvHO8zRgjQoM4c8RA067oEkRSpfZ
	aeO+X9wKnkmFJIqFhBTEwQCqwyQAqDKNFgg4xXg5DxmHN3j/Y5Rc9UQFCUpRngLHohAyEOg+RmW
	wVkAYHRB7oDo+/KBff5gF3UUFDzz7ScPZ+VupnqsbkszVaiucbndOilpwzSXGEWsf3TA4/Y08k4
	9wFuja6KOqZCaDHxyZq4iSb4PdNGFvTHcQSl9dy88NeOtNE5f2P3X0tJTON9letgvwZnCPmHNrQ
	r7Cp5tCTYPyRGIj7LgHczWhgC1rpOd+ACPChSTUE1V6EpEOsWPVItLsFSkK4rS7YJ3VEQpbPfE1
	bETvqYGBghTXnUiZ1C+tpnr3txoeBc3pxn3W3v61Na2KS+SXT8hq6c21nUX+r3vNgNf0=
X-Google-Smtp-Source: AGHT+IE+IYKiRpEjUqHImSI00u6cF4PFdF1GH74nExNMmIPL8P92h3i3/FToK8gMkIESeeV2Lkl61g==
X-Received: by 2002:a05:600c:4e8e:b0:45d:d97c:235e with SMTP id 5b1f17b1804b1-46e6127a1a2mr20622315e9.12.1759302934915;
        Wed, 01 Oct 2025 00:15:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a0241bsm24801515e9.11.2025.10.01.00.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:15:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
References: <20250910-shift6mq-panel-v3-0-a7729911afb9@sigxcpu.org>
Subject: Re: (subset) [PATCH v3 0/3] drm/panel: visionox-rm69299: Add
 backlight support and small fixes
Message-Id: <175930293421.429742.3887174305831150628.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:15:34 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 10 Sep 2025 18:39:55 +0200, Guido Günther wrote:
> This adds optional backlight support via DSI commands. If
> a max_brightness is set in the panel description the backlight
> is created.
> 
> While at that we fold in the already sent out clock fix and
> a fix that prevents us from clearing all mode flags when we
> only want HS mode.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/panel: visionox-rm69299: Fix clock frequency for SHIFT6mq
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d298062312724606855294503acebc7ee55ffbca
[2/3] drm/panel: visionox-rm69299: Don't clear all mode flags
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/39144b611e9cd4f5814f4098c891b545dd70c536
[3/3] drm/panel: visionox-rm69299: Add backlight support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7911d8cab55453b6bf59cd1f806503c3dbf0e990

-- 
Neil

