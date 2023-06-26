Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC56DEB64DA
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jun 2023 09:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjFZJre (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jun 2023 05:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjFZJre (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jun 2023 05:47:34 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B483C9D
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 02:47:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so3980078e87.2
        for <phone-devel@vger.kernel.org>; Mon, 26 Jun 2023 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687772850; x=1690364850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikXy1jq/ENeoE6PNjapkOmk54jjfZD5XI44Qmjm54W0=;
        b=Bk75oGDe5gH7qUJe8WEDZ7V2XRZfYJIXEQ0/CG6b+r7iY/yJ1NYrHtiN2LD6jTE/s4
         fQBw1/SYq0/APEbMsnG/Foe6QdCdyatmCOYmP/mUwLGu4cPl74/arS2hILKezv8PUgZ3
         7X3SJUefmd7f86wZWso0HBJL53q0qilKJKbIasBOmmYAjlIJHA+LIW+LyW2V4Ly9kwiq
         xRj1fQuCJSPRABdsdK+mFakeMGYYoby3r7IhJH7UxBTAESOYj4DiKMnjiCtzrhTH79th
         WL+jGW9uU6w7BsnF9qPJ9B0KXMKUIL/QV1Z1aGvCa05Sa+lQFN2fNqcSYpx8doVD654i
         4+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687772850; x=1690364850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikXy1jq/ENeoE6PNjapkOmk54jjfZD5XI44Qmjm54W0=;
        b=OZMIFDqnMtayJIl6NgKGS/Hl4wA3bcPNr8h+puLroES8TLVbX8yibpMyLA5GPcIQmK
         h1K+hK81QZhuYSZxscFcMgcRX6bneUEU52u2w5bsG9qzYzHzzoyOWG2vBBH0pL2FEkpD
         hyzc5B0oKqNeGgKEx7qnBsjeL4gE56dkgjpKZzdrOxFu90J3jGLu3akmjOwqcv42MHs8
         lS10n06mp8YRXq0VtFFEAd6RiioOx5YEAdFVxsTFE/FfnUb0Y5Ggzo9TQ/IxfZzVkH/C
         pQfadd/7wD7sH15VNjjRSQHMn5QtWeGtnI9FcV9IsL6kp/gdna58uAVp3eJIsty3xN2n
         bpQw==
X-Gm-Message-State: AC+VfDwvPuiwMFb5ZTmG/amChrnKEEMsJ8IeF/FZNeQz5JOJYvrhwrtj
        DJKqhrmJ9KT5M82vihpZZGzHpQ==
X-Google-Smtp-Source: ACHHUZ6H6RseaXXf5i6vaeIjaZ1z9RpuYSpoR9VT1+bBIKUFFrP6su3m4RwEYZ88L4do5Ygq8TINiA==
X-Received: by 2002:a05:6512:3b0a:b0:4f8:6fe9:3c9c with SMTP id f10-20020a0565123b0a00b004f86fe93c9cmr9269871lfv.49.1687772849900;
        Mon, 26 Jun 2023 02:47:29 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id r15-20020ac252af000000b004fb78959218sm149729lfm.200.2023.06.26.02.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 02:47:29 -0700 (PDT)
Message-ID: <2deff871-0c5b-2bb6-151c-b81d7f1373ac@linaro.org>
Date:   Mon, 26 Jun 2023 11:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] thermal/drivers/qcom/temp-alarm: Use dev_err_probe
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230625-spmi-temp-alarm-defer-v1-1-2d57acf36855@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625-spmi-temp-alarm-defer-v1-1-2d57acf36855@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25.06.2023 13:11, Luca Weiss wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed message includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 34 ++++++++++++-----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index 2a3b3e21260f..0e8ebfcd84c5 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -411,22 +411,19 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  	chip->base = res;
>  
>  	ret = qpnp_tm_read(chip, QPNP_TM_REG_TYPE, &type);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "could not read type\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not read type\n");
>  
>  	ret = qpnp_tm_read(chip, QPNP_TM_REG_SUBTYPE, &subtype);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "could not read subtype\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not read subtype\n");
>  
>  	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MAJOR, &dig_major);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "could not read dig_major\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not read dig_major\n");
>  
>  	if (type != QPNP_TM_TYPE || (subtype != QPNP_TM_SUBTYPE_GEN1
>  				     && subtype != QPNP_TM_SUBTYPE_GEN2)) {
> @@ -448,16 +445,13 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  	 */
>  	chip->tz_dev = devm_thermal_of_zone_register(
>  		&pdev->dev, 0, chip, &qpnp_tm_sensor_ops);
> -	if (IS_ERR(chip->tz_dev)) {
> -		dev_err(&pdev->dev, "failed to register sensor\n");
> -		return PTR_ERR(chip->tz_dev);
> -	}
> +	if (IS_ERR(chip->tz_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(chip->tz_dev),
> +				     "failed to register sensor\n");
>  
>  	ret = qpnp_tm_init(chip);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "init failed\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "init failed\n");
>  
>  	devm_thermal_add_hwmon_sysfs(&pdev->dev, chip->tz_dev);
>  
> 
> ---
> base-commit: 8d2be868b42c08290509c60515865f4de24ea704
> change-id: 20230625-spmi-temp-alarm-defer-0889b80544e3
> 
> Best regards,
