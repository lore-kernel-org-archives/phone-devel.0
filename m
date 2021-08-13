Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6040BC4338F
	for <phone-devel@archiver.kernel.org>; Fri, 13 Aug 2021 20:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E27D61042
	for <phone-devel@archiver.kernel.org>; Fri, 13 Aug 2021 20:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbhHMUli (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Aug 2021 16:41:38 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:36720 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbhHMUlh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Aug 2021 16:41:37 -0400
Received: by mail-oi1-f176.google.com with SMTP id bd1so10244355oib.3;
        Fri, 13 Aug 2021 13:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0SsWZijZ/OzRMl6BiNQIDWPa6YRhMZn0k/FbWIlqlck=;
        b=Jwv0JjqnlbFE9sfuj6vA6Xb+rcdUAsJ4ca2OUgYfPl4wuNQM/IKrNfJfWMEleOnK2L
         1e8fcTnsA5sB578t3N7JAnG+fQftAur1opwz4TlgABRmbreP+86ugeOe9hlVCKGZ400L
         ElRzJQTi8/rdak7liOuQHJYXgD19c+qajyBAQEOk0rzfRph6DkdUU6vUr9tGzB8HmvUi
         JE67aGdYDp7CidyiBPGIH6dOYjk0waOYUYaZJLc4tVVWtIqkdSImDk3upSEMLzOyW56z
         svLN8iG9n7gQQTKTNlcp8nITXeao+1qTOSNHOB5iOBWUjTF4WX+Ic00vWTFAvNGDtsdM
         QSUg==
X-Gm-Message-State: AOAM530WsI4I9AhR8KuT8oZBZLsZLh3kJPoUWBH/jA5hsnxOZGyGjmuu
        lk+Dc2WfHBH7o6x43a14xg==
X-Google-Smtp-Source: ABdhPJxIe0dRYdYroVcwOivLZ7rp/imyF64v62VnramgauO11+lTL97LS3Boj1WVh+q1Hvt6OnWYLg==
X-Received: by 2002:a05:6808:98c:: with SMTP id a12mr3573067oic.65.1628887270318;
        Fri, 13 Aug 2021 13:41:10 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com. [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
        by smtp.gmail.com with ESMTPSA id z23sm573865oib.36.2021.08.13.13.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:41:09 -0700 (PDT)
Received: (nullmailer pid 3992679 invoked by uid 1000);
        Fri, 13 Aug 2021 20:41:08 -0000
Date:   Fri, 13 Aug 2021 15:41:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        daniel@ffwll.ch, phone-devel@vger.kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        airlied@linux.ie
Subject: Re: [PATCH v2 1/2] drm/panel: Add DT bindings for Samsung S6D27A1
 display panel
Message-ID: <YRbY5OMjxQxA2CDb@robh.at.kernel.org>
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
 <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-2-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210807133111.5935-2-markuss.broks@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, 07 Aug 2021 16:31:10 +0300, Markuss Broks wrote:
> This adds device-tree bindings for the Samsung S6D27A1 RGB
> DPI display panel.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> 
> v1 -> v2:
> changed additionalProperties to unevaluatedProperties;
> added vci-supply and vccio-supply as required;
> ---
>  .../display/panel/samsung,s6d27a1.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
