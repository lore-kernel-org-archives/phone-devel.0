Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D510F335573
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586618; cv=none; b=aHjnK6x72mt7QGeLLrEOA+lTsJrUUXWYEGiULZ/mmtNXYPNFTEPOF4MdT7wC3qt2TD24FFK8XCyXnFrNyTXa0q1WIUIy4mwO2WzR/5tEXcBCWH8Xs3n7H+fNZG2ZT96VAcqU/AspR5/3XRSi0qzhu+HmwWeSowwe29/YCUznGkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586618; c=relaxed/simple;
	bh=KpR9XGC+Bx3BLKA6Y/iezvo9GcrGkG2svGi38rOB6y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BJ9twJ482w7j6BX5JtZWtPY1mDbSdzYulEpFxwylvInzDx2nw4PVZBBuKHv2d/7J3dHc2IySA/R9NEXw38OloODjAecwTEkgYUtxvPJiQE2d4ub8MK6Uffm2/gru+qAVWQjcuBdMwo9DcZZuIA2yJKIXyK0HFpKUAjKy82vE3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kckkdGJx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kckkdGJx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so3664140a12.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768586615; x=1769191415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzxoYSCgeFJWxhjkLGYTzXNDLcf4pbH0TysaMixA8sU=;
        b=kckkdGJxk3Qpnf98p5Ygoao1rlIqdKAeCNduvYVXNHY8aJZIuIfoaeRYbKMzvgYQU6
         lcnGpyqAUK+UEWevouRsYuyXdSNZV1XS311PilkCzGMES//4Uwj5Bvhxxg9BKCzkpGBo
         Bkgj3wNuJxXRjzK8/QYHFrZt8qYRAbqOGQ/7UaoqZPiifF7C7k49rey/L/y6PsCg3Mhl
         9mMKlXgoavJVaYHTs7zA3hhIuQVR7Zbl8Ku+Ghe77afCM7b169vFojyxqo8y0hdnuBla
         W3k10FOSK71KEPEMFel0cxxe5okNo2jw5dTd+kS8qE/wKajAG9YglMqkaqhiTe7G1xkr
         77fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768586615; x=1769191415;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzxoYSCgeFJWxhjkLGYTzXNDLcf4pbH0TysaMixA8sU=;
        b=cDyDSaFKrThHRHe0BO3vn0yTbJlRUUwv0LCoQdhf7yQx7Q58gX/2XYlG5xre+Evl/J
         0i74u0phOF0ylKIYI0Z3ENUqg2b8vCINbDl2odRR7UqRrpml63cJNg7o4cIi8lSFWK6n
         Q7il+uqYcOtfS52vnJQZqf+SACIHoq2XBjt+CcmTtLTKTF0hoFRkvzaFH6PNWSg+tXgY
         O6/WqnTkSbSn8dAPpWxvr5Mu96j3itIwDz/OR37f7ZbL9DcmU8a3qeN1JlEaFhak6DY1
         9rS3rTjoeKPunYyqxZ1qfX4Rp013W1OOsmP4EQ/32Fzvm6im0e1EthvdPxyY1WPPpgy+
         Uu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3Fvcxhed872v4pGbFITQrzFXwjybhA9DXamB/gP1T3IZRg2ZyzgibgLwdc/DD41ambm67JofxGIkFlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/rbScvM13IkPJ1oHmWvkR8/hWnRUzDofcExzZvUKIiy3sy5L
	NasJqyALwX3QtxZw7DFQWENhjA6D3h3KQZZAcivaUeoJwrs05kNUMNQNW1HEMk3y7zA=
X-Gm-Gg: AY/fxX7KuvMwHKbCu5qQiyvZQyORc7qxLQlBdBZpO6q1WHwSwqThfsBXYHGSCM7vY52
	cpb25zgsD44i0U6WbowuXpKQdl5NOOEX5Jlje0WDzeNhauQNLQyTm1jXoDJeW0qAjgpIqUmi/oR
	8zqQ9grkbogfnGPFqDDmXZl+ntaEongS+AgPMf4mnNf8/qRHC8NONHKa9yQr2K8fODc/4XJKe+E
	ploU+TsYzN/iDMIf+bA6qvm1SRKj36mzK0X67VfC+9PNAW9jmUjx6RSyWKWH96ksUEu49+S8KsF
	EQvSZu6GECFNNYb2b6hxmE3gLuqRhDbEkhjGA156FLKtXfv3yqnN0WRdgDQJbwVw+yhGcFjDeZw
	ZeEeKKW1kfKjt30H8TA1O6qnfXqsaPEolvhom/fBdSe72pDS8B2xabhRTXO8b12OYEVcx2oN5D7
	HldcMrBRyysKUk1raYy3O78isir4ys4mCWyHlFESWYhL2Rnr5JQvdcjA==
X-Received: by 2002:a05:6402:42d3:b0:64b:7e89:811 with SMTP id 4fb4d7f45d1cf-654ba1d2dc2mr2735165a12.13.1768586615205;
        Fri, 16 Jan 2026 10:03:35 -0800 (PST)
Received: from lion.localdomain (p5b29e30b.dip0.t-ipconnect.de. [91.41.227.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc5e1sm2932712a12.19.2026.01.16.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 10:03:34 -0800 (PST)
From: Casey Connolly <casey.connolly@linaro.org>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de, Petr Vorel <petr.vorel@gmail.com>, 
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Tom Rini <trini@konsulko.com>, Luca Weiss <luca.weiss@fairphone.com>, 
 Simon Glass <sjg@chromium.org>, Petr Hodina <petr.hodina@protonmail.com>, 
 Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org, 
 Simon Glass <simon.glass@canonical.com>
In-Reply-To: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
References: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
Subject: Re: [PATCH v4 0/2] Introduce Pixel config fragment for
 chainloading u-boot
Message-Id: <176858661385.3399278.12645916008692694395.b4-ty@linaro.org>
Date: Fri, 16 Jan 2026 19:03:33 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773


On Thu, 08 Jan 2026 23:13:00 +0100, David Heidelberg wrote:
> Snapdragon Google Pixel bootloaders require the TEXT_OFFSET to be
> exactly 0x80000. Without this, U-Boot or kernels will fail to load.
> 
> This patchset documents Pixel 3 and Pixel 3 XL and adds the necessary
> config fragment along with usage instructions.
> 
> It has been tested on Pixel 3, 3 XL (by me), and Pixel 5 (by Petr Vorel).
> 
> [...]

Applied, thanks!

[1/2] doc: board: qualcomm: document Pixel 3 / 3 XL support
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/500d2e5e5546
[2/2] configs: Add google-pixel fragment config for Pixel 3, 3 XL, 5
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/338dbbba8787

Best regards,
-- 
// Casey (she/they)


