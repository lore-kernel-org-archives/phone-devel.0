Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA622FD1B6
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570954; cv=none; b=HvGtu4BTbzxkcysnnEn3Kds64wtUCBnnEYPYs3tdgvZnMpoiQOGX8ZXyk7VfEQGUkUbYqJE9k344EGsWij/YSs5Tysuju8p7/GhrCkXOvYXFyS6X6MfLb2U96nIIrRSm1uSHbySFJeDF+SO7/7l6ZVSi59fvu1w/SH2XrZlGSR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570954; c=relaxed/simple;
	bh=leYy/21UTD6pIL/9i4ukZ60KL/cbDqbrZ8frEBNBMrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gNhe6QoMe8X6AfITJ+XGJeiYMhDLJAyGS66iA7Qro4ZyxtpgZXy//ezJ+WBKF750UwveCrBx7Mi9cJ1HO3a4XoUm2D1N+Su8XRwJbq8IkYU0dbb/ZbBn8llBR9J2yxy92uAr2Un7XulEFAjJ3G5kP4YgueaheXvUo8ZI7Y2cmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQ9we3+K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQ9we3+K"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso3755811f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763570950; x=1764175750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL7qlh37zkRZTRlu95aZolyP82BIEUWrPCKsF6oXxAU=;
        b=AQ9we3+KpTwgKIDxJ2iGz6vqdrRnBsE9TN/8+k4vo/O4kZoiuhRczSgS6rhnaYF29K
         9YN1MBtCQHXPJwoEvtbj38xWip5/C+kGVanAfZaq1eiWvAEawvRHoukGXAN7fh5l/54S
         bp3E/EV7nLucVe5Zye6sy6HNgYGcqUcsHWfgCEAk/3GgDwEpTjX3ILYoIvUIxIRk8v0/
         F4yugJQlhBbMrqRQP359MwUS2Ns1U6sYz/KM2NxlHdxJ6wIM/5C+e40CcjaLhqxjcUUk
         ykeCPtr6qcDlvHNfl7FtHaw+YAua4N9CvpTVDQ0ZEOAIyasbki8ODw8lH7AxwpKD0shr
         AGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570950; x=1764175750;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GL7qlh37zkRZTRlu95aZolyP82BIEUWrPCKsF6oXxAU=;
        b=lQW9wa5Ukpu8By+x6FvQhCW5zNQ/vyZ8z0PHNSracRWftP9p1gWRRX84PejUdmM622
         s5f6CIE6Y/NUaFSEhs7oVf6sQ6st27rDc3TAocHuP0QgAVsM5qgLwSPf/VKHFDEl/RsO
         KCgzz/x3Qyyz6yy+lPzmR1lCEzIJfwYHmEjkn8v5dGMnNuNKWlu7pV4Tatt5YsGTToRR
         GxDitIiohvuN5Tmjmk8olyLc3gq0hx6TceNNzuZ8fFl1iRHd3ST2TEUPhboY9w2Z4I5W
         NJ/4d9L98Un+uLzhJ/kLM0/lD8VtYbIy6v0C8aOGqbrJhkpqinHoWc9B57QUDk41+IyG
         ta8w==
X-Forwarded-Encrypted: i=1; AJvYcCX752VzGI6bepCGuY1MQYNsPs+KZZve/Rm9N3g/q5XMI6xRRvuI24KVGcnMFxw0dvGbIFLQ/UonSNrMJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/u+JDgXk7MPdp/b1fPkHyGmIIFXVqdDuya9o8D55Nj0VqSi2
	Gw4YLE3b9AaIJE1mfUrQBwdDXym6g6BTnhLUKA/RfUsFbpSZxohIoM7KE2mco7EiMWk=
X-Gm-Gg: ASbGncvgM4CIM8bEeYDpT6VRzIXUentyf9tharjzTt3Hq6uFgVKSc2MJZooF4CVosh/
	L39xZ6WC1ZMfJ2iqdBX7TakugZ8C4zeoyzv+FraMPccW4fdXGuOdVsQUPGO6Gw3bf9uK5sh28a1
	Tsa5C8aUz91ebogq4AnP1QpsCkLl0toiE1cfpLbN6UTfw+z9B/X8Z0BZVpqQrHBxUBtM+G+tzF1
	oK49e9z7CmdpG1iSfkbtqgnXrQxUSswjl4Vh8kLrcywLU3DbGfDS0c/bytK4kWZnWmn4b+aYUvi
	k++1zL2YM7e5NHTk5vc1opjnmG9balWiZvHpA1T4RB7I+VxWMEI3QDwarhVQAAZtJ8qjkK63Hx/
	8IGXTNbA4UDIIY4CRbYfm7Sm6qnGGE4KvYxTMG3UrbRubWulzQNpHmArilTyUi5GXmn9dNdJorT
	vzyPsur5N5W5kKK/D5UOJDko4T03BzX9Osk6dej/BJXg==
X-Google-Smtp-Source: AGHT+IEOxKlCU0fVyUxW6LWeLn7CtAluz8WjPTxaroJlgm9DOICHacN8yAahbHX8pTucfhXi884sbA==
X-Received: by 2002:a05:6000:64a:b0:42b:4267:83d5 with SMTP id ffacd0b85a97d-42b5935dde3mr18285757f8f.8.1763570950069;
        Wed, 19 Nov 2025 08:49:10 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:49:09 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
Subject: Re: (subset) [PATCH v3 00/12] Make Samsung SOFEF00 DDIC and panel
 work
Message-Id: <176357094919.280640.16902732888424119445.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:09 +0100
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

On Wed, 19 Nov 2025 15:21:25 +0100, David Heidelberg wrote:
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 
> The mainline driver was broken so far, and with my recent introduction
> of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
> common device-tree changes which defined all the regulators and
> corrected properties.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1388c08c84a2b1f37abae656c1f88d18ecb1364e
[03/12] drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/05aeb5bb4b699b51f88d9f5585005b6eb66a496b
[04/12] drm/panel: sofef00: Handle all regulators
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dfc7e0859e05991b0920bd249434e44866a11bd1
[05/12] drm/panel: sofef00: Split sending commands to the enable/disable functions
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/18642542ac4916807fc0925cdcb9356f5802e2ae
[06/12] drm/panel: sofef00: Introduce page macro
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9f1ba273f55f93759cfd1098e0682b03eb115bb4
[07/12] drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1e534a56578bbea59165c3507d2b967f29771792
[08/12] drm/panel: sofef00: Initialise at 50% brightness
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e2e94464cf44f91c92eb631d609f812c7aef8840
[09/12] drm/panel: sofef00: Introduce compatible which includes the panel name
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6a353661e7058795a800de3535e4e1448d125676
[10/12] drm/panel: sofef00: Simplify get_modes
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/940c451981ebd0901f39675c9ff3b3e1c9760571
[11/12] drm/panel: sofef00: Mark the LPM mode always-on
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/73540e5e7c52264633c66aad681e53f7e2f54c57
[12/12] drm/panel: sofef00: Non-continuous mode and video burst are supported
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8bff3a2bf7c50bf45766edcd5440329d6b5cdf96

-- 
Neil

