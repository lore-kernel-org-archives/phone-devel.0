Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC823A9BE
	for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798586; cv=none; b=XfG+SLJ80jp2saMMmbRKR9ag0I1KNzV9P5TFpVsQ6RLypEsgSRF8KqpP6d+O+dOwVesGaPqJTAN+QuKdMRhSZ6+ST/7bQiD1JqDN6uqA/0sAi6+xFhabkuXAzWIt5+YsnyacTdzKr+y9RYPd40/fLjhIl6YRIXBgVx2nRYvjKBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798586; c=relaxed/simple;
	bh=iywYQxRz9CS7up3Rb4XVNLQEC9bvPlsrkIVlIPpDzfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hVo6Y55/uFXFUklC2lfj/roSZVJ0efnx5wI2T0mej82x2HlyfuvFF/DLTSFM9LeaMdhCmYx1dE8dxuGNQJOwJLJ5Kw7QvH/Etu1uupQr467lf9gUXNcJR1SOSJtlLtOtx1vr+0Ryu5L9KJ7L2FT02Ro4SGVBvoxXiBQFyno9kmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCfEnNQT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCfEnNQT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so421905e9.1
        for <phone-devel@vger.kernel.org>; Sat, 13 Sep 2025 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798583; x=1758403383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iywYQxRz9CS7up3Rb4XVNLQEC9bvPlsrkIVlIPpDzfw=;
        b=LCfEnNQTkDc3WZXvNt+khxghbuibFKNLjrncEpTucIfGJC033gS3YoVt5PE0zNZx/z
         vt1n64nrPQCdmNokuSaZchHywnumop+wglV2YeKDBY9kP2OMnoBMRh+wAB+xtOjroEPl
         gozt3JlGjm/YXhwmPOr+FlDTDhiRyLQCW9RY80TgpnDWqk4IzuqklIXl+WTHl9EqX1ow
         aND0IhBYyvvVzsGXIroeaDQ22aEDG/PmrCb8sBrLWo3Uynh7sd/tTaNRbisg48nwU7a7
         WXNOj8/G3SkFrI3tlzU/zZ73FhxUc+OxPvNErZwu7yihYqoeU4dZ8lBsDNuX4Nd/amLE
         0RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798583; x=1758403383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iywYQxRz9CS7up3Rb4XVNLQEC9bvPlsrkIVlIPpDzfw=;
        b=XDQXbEmJX+sTlN7+lSXoxfbyLujxN5hxilCad4MhF7y9PU4EHRy9CUbAlV0Lc4STDe
         whRV8XGRZNU6xvs8KDbnhI4P5AFQ7eWlj4TIZLq1TGc4bScBawgZTF8t3h+i2C95dtFB
         arXHEiJsdIr/O5Wo+yBuRXYgzasQBlASaAhqiXcPIv88GFwnXnNL72DNMBGENF0cZIWs
         bFNZcvOjcay4a2TvlYwa76c5Fne+Zgk5bCsIBb/zM2q9NEnDCABMymLwrv1GLxDFYKDe
         UM4dfXQxd6SWW4IYxCPdQoRn4qdjqFzbdIUaNqdyjvmh5T9C9EWXVShdGGMkqayjpXZ8
         pxVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7C2sBcnqzLHPgz6mOu8Pqhji6JrL1TGHwN5a0PtSLoyF0/p11Km257CZjmAvUcVDh1vnnagNhfxzZvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIw6o5Md/Y/Lz6Dquht8Sviq0vyQWBWiTf+c/CfQsUfYSgzGa
	wV+awdDgeerZxf7ElU5dPyhs4EYfdagqT6Fh9ASFXPfia/K1ZIBP/KH6
X-Gm-Gg: ASbGnctLskuYkngeFj4IWYK8NXkeSqf6lV79uF5/bQSALNgArltwPV3ctkbqLNSrywD
	2bjOYlMoIoQ+GMjKGZGAacqxa/vaQMhKzzkxpnFguj12fasJO7N3wF2yDYR/lO4qGYbQM8btbSo
	u9Ac6qYNOGyb7yZRwu52h2pS5PgmNFg8LwcfjXOhSwLmApiVBbcJB5VFHCZifBc3c4RD/1Vj4mA
	B5O1WXEffI2uNsz9MqUKHTV6jANAPsCMaT1oB5Xp2LQi2pOexrjxDMVXbfSm142Z35IWX0S+4vH
	bT18jZ/CCAckxQ8GuWHoOZg9nT2UK7lKt2opXksiLIC85fJRkU76PfG5E9b0hPNnf1fY++1dJap
	c56dFyS+eCEDoS9sTXOsGyS8PyBJXv1zfOcDuyGCuEYeHTVsw
X-Google-Smtp-Source: AGHT+IEW20rf2hIhimdxJS1T6kk93raCiCsoiaFO2LWxY/a237S3KFMKKEA8B3zumhUKy7Hqe0S/gA==
X-Received: by 2002:a05:600c:605a:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-45f211cb5c2mr51983385e9.1.1757798582965;
        Sat, 13 Sep 2025 14:23:02 -0700 (PDT)
Received: from radijator.localnet ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5c5dsm114475115e9.14.2025.09.13.14.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:23:02 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH RESEND 0/9] samsung,coreprimevelte DTS additions
Date: Sat, 13 Sep 2025 23:23:00 +0200
Message-ID: <12753058.O9o76ZdvQC@radijator>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Resent due to mail server issues with the initial send.

Regards,
--
Duje


