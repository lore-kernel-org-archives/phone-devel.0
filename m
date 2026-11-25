Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621201;
	b=fyMs8jdSl3z516fOtfcQdqDqAz8myi/P+6wujdnlDsgYE8j5LHpAOJ1m/VjU8T9Lgz2G
	 WwZsx5on8SB8nJJcMz9v98ujMO9SpBL+xcBrcawbordOdCg4Xm8GuXIiyEllnoI2djSp/
	 Is5B/VB+WeWTz2/ZvxnHSGChSViCDYDJXJBmjJ1SPFumID898YzpILlg2JJjLY1UBAnXB
	 55RmuEzOADmR+Ki4Jw/9b0g4VxBeYnZ8YpZV/YS5Yu1Ie7AB2tUEMfmAIbidIBkvo87JG
	 bNUHH7pg7HmOBbYLu8mNl3JGeimsgTvD/Z/e5CURq4Ur5304NuDMgjSOrnI+4NIYEKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
	b=Voe8QEd0QheFhvJQCfOWWL9K21islptxEBJeciyFuUK356sNJcYuWDy+5ACppdq9cRim
	 5Q3CVoefDpS5EOXeBqZHJ4t/HbhYQdf/4GVVBINjPnbc/e0RECirZwR04oYyCLKKRM49a
	 YKlBjAwMhEdw0fqkBL3EMjHgFi1yD1Yh7cCsffDa2Z3WWWTbRWEY8mGVH046WGiyIOMV5
	 Gc5U1pfUlwjHs3lXzRWS7tCZxIgrVS0RcbVLLHDiTZBqErmSk+A7r2csPrbXHTCdjheYX
	 aviuZn3Mypgy/+9bcrH3ajbiHsVRAzKJ7ctWVv4EyvxAAB1vALdMGgm1+hT4ocVSlKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749B606A32C
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D749B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so56646555e9.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795621199; x=1796225999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=RjxdsfKwvvddGpQSiNhRsMhHqK+KznqtEzdvJlHNkNxRcNDDOnVVWr0obg9T1+w5YF
         IXSVqRD72Kt14j7/vOch3js9XRZ+MOQav6q+WBeAvgDXBYU5UAlDmPZTqqj8maE6QTzk
         RH8OhZMEzGRWmI13DO0mVDzTjznLEvNsLJudBVG0o/2U0CAzCh/p18Eis767vb0mWFkt
         wOdRWWP4FXylRdYfohZkobSdmX/jcRRrz2lvpCrUBmEAS1NrPXbhC2X+VCfPh1YPFPHV
         tgqR26Le1ES5fcDtsnSZid+RMgOyE6a704dSJca23QAMgNQkjO3J1mJm4VtXdQs4IgSd
         E3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621199; x=1796225999;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=IIqqBiube1ghgv2/MJr6nPfOTFF5IWnc0caVmKvA2GGyBEA/A/U46aZK4vrJ9gGfiP
         8BukWo9+HoJ0yr/tm7pOxedW4ignMH0ZMiApycwuk0vuNqb9RWzDmWyVll4oqlJGoUM2
         egXJAxN4zioRRa0ep4Fynh0Ryb1qS2s6gpUZ1MKo1b3ElPYc31Gx0sl4eqv3FVo/6J9K
         IQUgolfLy79ukWunajTG1EwRtYMQxOhEoJyQCbt7DbhLJBTWEvRltMPESccFyTNW5xEQ
         TXUlY7eBsHNY8W5hrieTW5rnmIcRE1vJIpslefygNg5vbIzISRRSYBvwbZUHLEYdSwSf
         FM/w==
X-Forwarded-Encrypted: i=1; AL+hErG8VJgoOPO5tLAd4GWODW6gYci5tjRGb8qe5QvT4yHId0+LjWrxMLzkrwKggapMQbVcYJy8jdvA/JJo3w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/EpxzaIpiZd29UV8Oxiy7I+cg+r6rvIlL21xTw7erunGjzmM9C
	Fr0xH6C6RoGPO1gOOf/px9Lx3eY1vWDsaZCtPhqDxAWc1/hyOtl7rZMyk20O18ea9yo=
X-Gm-Gg: AZFdTZcHrehuRRe2b25IfiGDfXCIWViCbQ4NqSaC186nFGAEeibnVuAqT5uj5S33exk
	sPpDAx2DMevbICdxSYCl1ZFO2sLRH1xiXa1BYV+MtkQF/2ipxk5FGutMjU4tzKJzfBtXG1HGO3q
	jAY4ne+la8n5+FgKBbKf60s25TBu6t1BcydZTp+46fF1dWjlWW78smW41R60naZl8j8XCrVOmny
	5tZLiDe048bcn8VHzURCwLSDG1xWPJbwm2v8g91awZFGAZzUFT1TI7bGenivYA/m0qRWsXeD6tW
	jvZSpZ8tAG2P3f/3+4Sp1awIj+EStTQ2pyUn9T4EGPucNZGtwyLlR6OsHvumUDFpXTMs/+7DudZ
	9RLXYcwA3C+2I6LbdtOFe5WGJxdsqgM1Xu2xF7fbmIvkglfrgrRmC79ExKMTMw+WGK8kalaBvqq
	X+nUK9n4g9CnarR7BgjwkYjnEdVrkiaXNyCZCCYPQoJs76Y9qkEtystrRC50sRVlxfVttAFzGtH
	CBK0k0BhG3D5ggX1B0Jx+KarxHsJQ1Zjkr6NrzAuOR9XiyrZeD4f0/Q8i5d1KeSvxXEqbomfftw
	/d2sGwurURNnb81v+pfAUOyBAK1G+zB5zCAzvQ==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr427623865e9.6.1795621199120;
        Wed, 25 Nov 2026 07:39:59 -0800 (PST)
Received: from [10.229.50.9] ([90.82.202.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm14255031f8f.9.2026.11.25.07.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:39:58 -0800 (PST)
Message-ID: <8a9a4fe1-0fa5-4c48-aa88-f61b3a01739f@linaro.org>
Date: Wed, 25 Nov 2026 16:39:57 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/panel: lg-sw43408: use the full DCS brightness
 range
To: david@ixit.cz, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vendor changed the value multiple times. Last value for production
> devices was 900. HBM can go up to 1023, but keep value safe for now.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 822318f546ef3..92cab6478ea61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -197,17 +197,18 @@ static const struct backlight_ops sw43408_backlight_ops = {
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
>   	struct device *dev = &ctx->link->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
> -		.max_brightness = 255,
> +		/* HBM can go up to 1023, stay safe for now */
> +		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
>   							     ctx->link,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
