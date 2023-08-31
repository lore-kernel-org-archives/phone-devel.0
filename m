Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761BAC83F29
	for <phone-devel@archiver.kernel.org>; Thu, 31 Aug 2023 05:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241370AbjHaFBR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 31 Aug 2023 01:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239914AbjHaFBQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 31 Aug 2023 01:01:16 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937DEEA
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 22:01:12 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bdf4752c3cso2681825ad.2
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693458072; x=1694062872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LG57Ipqd8qnPkHXmEM2qU3rXEf7cPd3YjyUXTm2SJUY=;
        b=ZW7uzyAA3Mj4dWvC2R0TadSaGLhea/1SJyIyxX1ek9CNtwKfUFk1/EVyLrKPT1pAr3
         y5J0UEF8eSaWE+KjtBFWZ8hjCARAFpy7phcCrj/HG//iXJX3TJ+/lx88DvOnsaY42rXd
         cq0EzWV3FvR8Z/0wtPxW256BQXfFoCNSByabYVlQOIpAU3UfkQW7LGvGpCHw53p1UraX
         gcZEtgEkbkaY591Jd7nVKwKVRC8jyWh9/y79UMHhzX9eSjWLwTmjcXAfYhKLqSynZRyw
         O31PiLfPEWxOJp7j+uy1Xp30ytdc+hhvZQwmGTTrS36vkgoPZtqTzqo3PL/ozt4B8RbV
         GMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693458072; x=1694062872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG57Ipqd8qnPkHXmEM2qU3rXEf7cPd3YjyUXTm2SJUY=;
        b=dbar4YVCE+Pit75ublV98I2EycaPFGbHVmJd/X6yioJnASCp34ChLvEZZnRwAZvzSl
         4o37FZ98S61FmdmzyHtb8+HBzPtvYdZ0fgYWlm0mZR/L6WZzMngeidigizgYhr0ggVJ2
         YgI3D7oh7zV5hZKbBKT3TS/O95RhoByBh0xcEvu6gjw7d8DREuUML5YVdx3cs/X1B2kk
         cg6VEgunY/FLlU201EilfUk7+1aB8JJAis538cyN0X4FWlSFe27DewaOoZ7QdNRJ8kyh
         GTC8xs3ss0nym+fxRlnL1v3uujvDIaKP7nVBIcp3DoVKhKw9Rn9HRXpGo9/Y9jbodAw+
         q/tg==
X-Gm-Message-State: AOJu0YyTXprwDfwnFkZpgNLw4+suxgTBkIwQDyltDsCF2OAnpsePGFZw
        MXo0/rc/KGG6jhaIQWXat1ljBw==
X-Google-Smtp-Source: AGHT+IFQZQgyo7Kbxxv4n+DzGhsaV/YCZE33tGBr+rqZ2mBEdrv8HmDOp79McCilJd8OH8ltr0xGIg==
X-Received: by 2002:a17:902:c409:b0:1bc:6266:d0e4 with SMTP id k9-20020a170902c40900b001bc6266d0e4mr5133728plk.69.1693458072003;
        Wed, 30 Aug 2023 22:01:12 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id i2-20020a170902eb4200b001bf2dcfe352sm370068pli.234.2023.08.30.22.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 22:01:11 -0700 (PDT)
Date:   Thu, 31 Aug 2023 10:31:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 09/11] cpufreq: Add QCM6490 to cpufreq-dt-platdev
 blocklist
Message-ID: <20230831050108.yt7obgdqmcz73brn@vireshk-i7>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-9-5a954519bbad@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830-fp5-initial-v1-9-5a954519bbad@fairphone.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30-08-23, 11:58, Luca Weiss wrote:
> The Qualcomm QCM6490 platform uses the qcom-cpufreq-hw driver, so add it
> to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index fb2875ce1fdd..02ec58a8603b 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -145,6 +145,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "qcom,msm8996", },
>  	{ .compatible = "qcom,msm8998", },
>  	{ .compatible = "qcom,qcm2290", },
> +	{ .compatible = "qcom,qcm6490", },
>  	{ .compatible = "qcom,qcs404", },
>  	{ .compatible = "qcom,qdu1000", },
>  	{ .compatible = "qcom,sa8155p" },

Applied. Thanks.

-- 
viresh
