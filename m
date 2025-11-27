Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA2F39A4;
	Thu, 27 Nov 2025 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764273908; cv=none; b=NGGg+wWRpOiSpVgYpUmnLg/mQOJmUsdtM1YIsdZsbWl0uJZF3YJ31IyptGqNr7k89y2LUVJ5rb/9aV4ASlCxETXIRGIUage7dG72ziLdqiV4ULuqIzZEy4Bdb5LSDNOMS2afy/Fox1ancaT+wvaIuCEHMAumD2BfJmVfbt84OVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764273908; c=relaxed/simple;
	bh=ge72D+FN3ifjH1rx/CAtR9G+gkJrdGvtzHJKJ2NFMHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cMAHp5twBAQo3ipRVAWM36EBulaY32wBdf7c+PwnPBzL2Rpmjaih44mw4SN8HSJM9JqNgjRs2h6XjBTZMQjNuJKv/sPxAkX1gVHsrJZm6Canbv8V/hY6LMlclZZ4buJlxHI0fLF1wzvWeE2FAQvPD2zZE7EG6ht+Czae+jj0oPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=liLcA4nM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="liLcA4nM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=q+98UZ8NUAj+JDr0X7955//c+A/TVUEg/6X7IEmZKZI=; b=liLcA4nMu9WKfXg+wMWZZmqDg0
	G5Gp3qCLbPiqOcmvft83Q6y+HNDwrUSYJGyG3DZiTOa6FGRb4EnwCi3pVhbBrwGlk60rSiO/IKcxA
	qsT3dO1ntDGpjJNYCHer8UsPhHwYqBbKWJSmzLq/zRoRtaedwGcKO42t8eQwqcn/0NlQdRx1Z16Om
	Q3Azt5GzHFP9FnouqXEvR+x/JOB3QxzZh6vy7IelJG4DIqlqa/eISG682LKLfxO15nJdOqHwOmKY+
	4bC1HB4emtysp27+OjPdmgNEHDzokR54OOeSQJATkSs3FqW8TcrUkLBR/YR9wJ45xlfZ2R0xSBcWO
	0XYlZLDw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOiEd-0000000HBC3-15yt;
	Thu, 27 Nov 2025 20:04:59 +0000
Message-ID: <85a55d62-a98c-4e4c-9dfc-48b4b58aa982@infradead.org>
Date: Thu, 27 Nov 2025 12:04:58 -0800
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Depend on
 BACKLIGHT_CLASS_DEVICE
To: Neil Armstrong <neil.armstrong@linaro.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel <phone-devel@vger.kernel.org>,
 Gustavo Padovan <gus@collabora.com>, "kernelci.org bot" <bot@kernelci.org>
References: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
 <dff86c02-996b-4aba-9f6b-013d1fcb040f@linaro.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <dff86c02-996b-4aba-9f6b-013d1fcb040f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/17/25 2:49 AM, Neil Armstrong wrote:
> On 10/17/25 10:27, Guido Günther wrote:
>> We handle backlight so need that dependency.
>>
>> Fixes: 49802972d116 ("drm/panel: visionox-rm69299: Add backlight support")
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>> Signed-off-by: Guido Günther <agx@sigxcpu.org>
>> ---
>> Changes in v2:
>> - Add Reported-by: kernelci.org bot <bot@kernelci.org>
>> - Link to v1: https://lore.kernel.org/r/20251016-visionox-rm69299-bl-v1-1-d3b817ae5a26@sigxcpu.org
>> ---
>>   drivers/gpu/drm/panel/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 407c5f6a268b..59f5a31f3381 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -1112,6 +1112,7 @@ config DRM_PANEL_VISIONOX_RM69299
>>       tristate "Visionox RM69299"
>>       depends on OF
>>       depends on DRM_MIPI_DSI
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       help
>>         Say Y here if you want to enable support for Visionox
>>         RM69299  DSI Video Mode panel.
>>
>> ---
>> base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
>> change-id: 20251016-visionox-rm69299-bl-7e6a2e30626d
>>
>> Best regards,
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

This patch is still needed (linux-next-20251127).
Is someone planning to merge it...?

Thanks.
-- 
~Randy
