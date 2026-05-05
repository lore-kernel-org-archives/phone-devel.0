Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76C47F2C5
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990279; cv=none; b=lQBM9TSCqks9+/N20yQwV+i7R2qPY2/ypRRaWlQWicNuRfzfat9637uJqkaGjMaA27nkRb59cDr7HL6O3Ij1cLLkPg1RqGdUQPaCAJnc2urKMP7IhxLAeKtY5xQ6HYNDP8/rj+wdFqv68uebUy1AwYBSH0cXbytQe2GN9tKf1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990279; c=relaxed/simple;
	bh=zEnzHxAZ8HzDK88sJwXMmhrqHFehlcwngHb5g3uBBnY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ct8i/nWq1kV1H9l0ohjY+WKrW48a4w2Q20IRkX1EwC1GnpvnVNZp9C0im8aar1tmpNEVorEsdIKvZ4+3TtSIfOAX3FqSMLK1MHlEQ6wSBHXtjMpd5QfN0z3A6zf3ioTGSYs3kddFzAvadQUzwhQhRwmjpI67uajlJS+FWVXTr1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8WSoDdl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8WSoDdl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso43460655e9.3
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777990276; x=1778595076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOzo5FIH+z+xgBcDFCcgeO0PNVBFl/6WTgvdlY46+YA=;
        b=O8WSoDdlUVmrODQ4Wg7ToZD/qjpJPwOXnMJf85x7ojg0wbHcL3rG1ZlnHR+stv/3Rq
         zN/S7mBxV0HWd+Wc5g9kal4V4waX6pRk7aHGWdQRo+yjNsyUiVSBKZ1PzhueZo3iLbTj
         51uAFh4XK+z/5x0M0FpqQlaiGr3xViZ0n+KfaaXX/JPlSoPp7+a+3jvJ5qBAB+xmvf8C
         wnBeyoS4vVntTqQAhKqGJlg+VUkAUv76SOxRacqd1EcBgOocUbv+vxe7Qe993IFcm/Do
         2xHZW90EVgzYbX5tch4YDbgeitlrEqLYDMVogQmeCHf7ViUHNG/LkA1l6PPhVzi+ftxe
         QsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990276; x=1778595076;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOzo5FIH+z+xgBcDFCcgeO0PNVBFl/6WTgvdlY46+YA=;
        b=CY9kGupvEQkUiUJ3o4cTEAAZoOX5HeJK9IwOSl8srDQFkTMxYkka9DcJY0l/hie0+y
         c3jl9M8OZk2c5fao9DFIqAcCcHP6+inCKnkht6iSFIoyfKZI0ZFWSDFJNTCE/GapeWW6
         6n+dTuV/psk8tUrnoHApuZN2G8+7Juvapn7gtpFrkg2/1Q3CatW9U0TeAJ2Muwy8qdel
         29cgVZf2YvydBZuYlTDTcxRdYCcEL9o79EHAe51yW5zWSLoKArQDospMvFW+IhuIU1Jl
         CQXMuQPoWjOu2W34E6gLr5c4Pi91ihTkOtM7N2wbYRJ5VTSEeMj96dU6XsYCO5uJKkua
         L1Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9IvFeWKZh0ZlOa29NaQ37ghE2Hc1PtMkC+THaLiDyboA0yIQm0JlCE+Ya/MYeNjTkh+MWkpCoAq9T7yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Mu1713Sq0cHrU73SfGmgNFWYxEbGvj+hdpr4/+IPPQSNSsCZ
	QGrSTW33EVp7yzDHrk9TzzDVEa5heTJoB/n+qMGshoLYhDaPOYcKTMsGnKkm/AsOJCA=
X-Gm-Gg: AeBDieuIMkUKGchOmpiUInoztjV3/saKo5uR2Sqc/ZRl+AyPcLOUT4gJXDjbjhHoCEr
	2u3nnbZSurg++eEXNCcxLYlUI7I6OfT0xl/FmWTlX6OW8ywKenCYf2sSm9Wp9gUGpzeDXvcTJUC
	dKi3fsqqxarmscB0ddg/i877KpzdbQ7HdNx/yrCiB8DNG6QmNHTw43oz7jBHOwbyOX4rV10VglP
	CLGDj+b1eaZ2utaIknJrkMDmTUW+LlO577hyTDdq2gQth18ktXwaxt2m3EOO3m5WqWe0vHGv/pX
	S/97VluRhcfLZDXncb9ZAO0XeY03FEmIL/6DhdkOcmKsARu3+M3nxl1YopnM2+hnrbDXtLmdM+K
	8LDPCLgF1tLXgyUqnsr9sib+S+FDawCb/yYu2Js0U7O3t0Lbl7GotMsB2PyFvTKFJYQYlfmXLiV
	suIbGY3z4nfMpZuL4MW6aMTePkGDLDICu6vfxU4jzzX8SwMbWDX4Jlq2ts94TimmJ6v5XhSQ1ru
	pxOXi4XVLpZEf44BQ==
X-Received: by 2002:a05:600c:859a:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48a9865e76bmr169457185e9.15.1777990274806;
        Tue, 05 May 2026 07:11:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:19a4:dd04:854d:9f82? ([2a01:e0a:106d:1080:19a4:dd04:854d:9f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14786affsm32297195e9.0.2026.05.05.07.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:11:14 -0700 (PDT)
Message-ID: <63278517-8df1-4cd0-ac59-6f7cd3ab1e42@linaro.org>
Date: Tue, 5 May 2026 16:11:13 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 0/4] drm/panel: Small Kconfig cleanup
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Heidelberg <david@ixit.cz>
Cc: Casey Connolly <casey.connolly@linaro.org>,
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
 <177799022301.801510.9046759541579593814.b4-ty@b4>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <177799022301.801510.9046759541579593814.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 16:10, Neil Armstrong wrote:
> Hi,
> 
> On Tue, 05 May 2026 15:53:39 +0200, David Heidelberg wrote:
>> Inspired by looking at Marijn patch. Since Marijn patch is not merged yet,
>> appending patch to my series.
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> 
> [4/4] drm/panel: Enable GPIOLIB for panels which uses functions from it
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ae3aa8cf5fd5ccb428a814e7eb38ae33ad1cfa34
> 

I had to fix patch 4 to apply, but I applied the 4 of them on drm-misc-next

Neil
