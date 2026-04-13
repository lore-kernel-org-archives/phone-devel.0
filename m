Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B25E1548C
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064337; cv=none; b=s4D6ZrX6sBQSr8Jl5Y2neb/z9WGZKMLAjuYfQ7v2Ctl4af+WKGk35lhvRqQeds16pwCY/86GFdfDhZlU4ri0DRdUBQ8bne/RMuXBS5elvTJuvwVO8wQaPlwQ9v9Wa7jWQONtGNA346K8tROPqkTsTo6dUZ9rexK6Y1D/amoChH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064337; c=relaxed/simple;
	bh=pyRyrGeRgn3gccRWNd9oANe9ty4qaiIwRTkZlb4h87U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QuUIJ2i6uByJ9cHCsM0xYObyhdm5AmnbhSyeTQ/OBrUuI52LGPnaEk7dJeBCWN+VhU5GM7EKpS9SbNXGhlMNUIIlIYFTzYdqbCRhZUykwk20Pz3uIZ6WEAZD0k42rmYx5VqVHfUtJkL2MJSOvj/XmVE5/XDRyUuGLAFryTPT9kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AqAa3RlC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AqAa3RlC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488afb0427eso51211855e9.1
        for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776064335; x=1776669135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlmjxh1MtlwNMpIIddLFKoO92223Pp5bRATczu14GeY=;
        b=AqAa3RlCwAtgTLlnxaEXL7SvVE6HOrnXH2zhwCuEaFxTHae9IhC4XpvTyv8wBNerYT
         MpgQWvw3dFxQAERJtql4NITmQbJsYjRC9e30RRwTfrROD65Iizf8KKBdw5phdB5Qtuh+
         mItFfi5hhgsQsk1RlAieD9P/xTA5qOGi1lu5CPTptGRE/ErqC80HHr4P3YzngHhfRjJ1
         kkeiW3+Zy680fXvnCR5cAYY81mpiv0QsNlhQ15pnwOmfKAeW+s15NEx5LuvSh+3oC3ac
         0+1fBPEubz5hD/NLJ+W3L3eHlbvO1W64E+uy4WVg8Nf5QssOac5yn+iXMbx0qN5M0ZdR
         ng2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776064335; x=1776669135;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlmjxh1MtlwNMpIIddLFKoO92223Pp5bRATczu14GeY=;
        b=dLOdIC/+pRNMcjwAVraS5i3/pIK8mgb1SirwKVj0O2lFKrM6Mz+eWsgWHpHszqLJSV
         gSh7cGDLmEqDr56S5PCzzYrvOOt+ENXvpyfJUqtCRQwmq+InoRHDZk/c2xfOYFbimr/J
         mchelS0Na9QiZSaHrWeEpSX1QC436L7175Inn2GGuNEiD5yFsdyyMeNfxVrIVki0UkB2
         CapKO64guqLG91KAO9GO11rh2JwVrSAQOPhFjM4dYi9WiqVnXfxtj0y6pivhchzaquys
         Surl3xlh4Xp8Lpdh8d8BUPZud1P5e5Hk3WiOK9OJP0OLw0GrumcFl/omSRzkMlaoHX1Y
         FMUw==
X-Forwarded-Encrypted: i=1; AFNElJ9u6gsMclIVWXg837p48bSXIDZhBtWO/PbYoYWLmAA4SRZn2MSGg+UBTR4bOtheCCt0vvxTzHO/CoOWzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkO8CSlQES/5yFGbTWpKzOSdlyhefLolQRm7fqdUn4adcnVxjd
	XJzc9aggrTO6NHyMlNFuFjt+aTU0/5X6vLySliZuI6KVGC+a+sMYvt8C4dia1bYcGYU=
X-Gm-Gg: AeBDies4C9HlSWaiLNIjZ2Wb+8LpV9vna/Hhw5Zv5MjCgxJhwArRnzhdcYseYRsrEHu
	wtXs9Atf+KeM4HmXvJkx7smFcLm4j5ouaahpx+cZSCdrSL2XbW3CKuh32aCBb2uAIaOC43uFtVP
	m0g7yItHZjj1htypXC8oyObKdHwdTM4B1HT8f6yNfsJFZeqKFFl/Zs+f5F/zzv3GoiaZXLjZOxL
	+PttY2lEuRCbqndrouZFEX03XtenOq1Qh/8aoK/ZKcTdWg2p1izqi84QwQdwm5a+GuijKomnkI2
	s+DR1w0lLSqvE5AroZzEA54EpuxnVPkUCET1QLeq9PXe36eVPTSLKU4+19aXK3nxRNOIGLpK5+a
	C3A/8HiNrU8XWFmhh4bal8aI9hZuOOLmbvoOSJduzdMiyD7O4TPZstLRt4LKfYDPom+2RR98N2g
	Og/1+MHDCTS23T/K7MshibkdLOLm0h36a5CtG+taHcYYKew9zjeHdN3hEo1cSKcw73kvNONiqq8
	u/CinE=
X-Received: by 2002:a05:600c:c16d:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488d66504bfmr174467825e9.0.1776064334547;
        Mon, 13 Apr 2026 00:12:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25? ([2a01:cb1c:fcf:4600:4cfb:7427:8a08:9d25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592db30sm255250805e9.10.2026.04.13.00.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 00:12:14 -0700 (PDT)
Message-ID: <a598a765-531a-4709-99e5-4597427d52b3@linaro.org>
Date: Mon, 13 Apr 2026 09:12:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [RFC PATCH 1/2] drm: Introduce drm_panel_prepare_for_mode
 callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Val Packett <val@packett.cool>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alicja Michalska <alicja.michalska@9elements.com>,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260412113851.355944-1-val@packett.cool>
 <20260412113851.355944-2-val@packett.cool>
 <uckcm7zviwss3jdjrapzd2fpivpdkrdbpcgju2hmrayulfzeaf@2tnli5evjtuh>
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
In-Reply-To: <uckcm7zviwss3jdjrapzd2fpivpdkrdbpcgju2hmrayulfzeaf@2tnli5evjtuh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/13/26 03:05, Dmitry Baryshkov wrote:
> On Sun, Apr 12, 2026 at 08:00:44AM -0300, Val Packett wrote:
>> Modern OLED panels often need to vary their prepare commands based on the
>> mode being set (resolution and refresh rate). Introduce a new variant of
>> the drm_panel_prepare callback that passes the chosen mode as an argument
>> to allow for this.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/gpu/drm/bridge/panel.c |  8 ++++++--
>>   drivers/gpu/drm/drm_panel.c    | 15 +++++++++++++--
>>   include/drm/drm_panel.h        | 12 ++++++++++++
>>   3 files changed, 31 insertions(+), 4 deletions(-)
>>
> 
> A (somewhat) better approach would be to let add .atomic_foo callbacks,
> which would receive drm_atomic_state instance. See  the discussion
> around [1].
> 
> [1] https://lore.kernel.org/dri-devel/nfc6ih43gjpi5u67fpkkxgwwygv53grdldq7tfp5iiukrkiy2u@53fsrtezzkyt/
> 

I agree, the plan to add a new atomic ops if much better.

Neil
