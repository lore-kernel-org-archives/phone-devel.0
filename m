Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A743C19F2D
	for <phone-devel@archiver.kernel.org>; Tue,  9 Aug 2022 10:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242195AbiHIKSY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 9 Aug 2022 06:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242134AbiHIKSX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 9 Aug 2022 06:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72E5E1F2ED
        for <phone-devel@vger.kernel.org>; Tue,  9 Aug 2022 03:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660040301;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JHIEhoKykhGtwT/qMh/qle5ZJQwQp7aXKTadoPkau8s=;
        b=a5br1gK6DPGok6GvOej20ProfDvbFBtJ+3yAXwLROc4AQVocYH5P25RKvg6xzwRtKiVEzK
        YfaubuMA6wshvrEDHjPWSGUdtfazfDAMTK9Z6JRZBkb2PZGhs4gelnndxfAppf3C2kUeyS
        KLogrWgNGBQB4dlyzd7CGj+Iy0L06Xk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-O8UeaYDsMY63xz-_-AUAog-1; Tue, 09 Aug 2022 06:18:20 -0400
X-MC-Unique: O8UeaYDsMY63xz-_-AUAog-1
Received: by mail-ej1-f72.google.com with SMTP id hv19-20020a17090760d300b00730d0a018a6so3329123ejc.21
        for <phone-devel@vger.kernel.org>; Tue, 09 Aug 2022 03:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=JHIEhoKykhGtwT/qMh/qle5ZJQwQp7aXKTadoPkau8s=;
        b=vfqS+RywToxJbTw2fIIL4Lxgby065xL3HQopf88ioC0Y/X6P1ADmBu2hwadjDrUiGZ
         ZjkD6Ks0nafqHa/oMEP3WkJQZB8JRHLgufgWUSklCEMASIDQ3sPIBZG2qMynDqOzhHAT
         3xni6ZhB6cB3IifHzzvekdTM0NLzRvTMXagYcJ1p07Tyi42jMvlxjDBAAGvHeY0KBeyx
         gKMz0GM45XK1SkOMEHmg39Alamq84aLQs/qcEpb9nSm+9hdD5EFlB/1QgcpP34fIrUSn
         iW0TOFCTLm17HK7tVrhiUYgXHCV1+0qasigBKbyCK21k/J+jfSxOespJKrt1L4LsTc++
         uGvw==
X-Gm-Message-State: ACgBeo2ACSw/hETUvAVWUZfwqkwcEu6JI+v7OLWjcFCYUGs+UK1GyOxL
        F2t3vB1hCavKWENjejHgWPPSTjdiTmByRsglae57XQLx3vQsmCdcaxodXl7mRIKxWbn6vKYWn3P
        /sxbWfzoSACKWxJVN0vrtonY=
X-Received: by 2002:a17:907:1c98:b0:730:d0bc:977c with SMTP id nb24-20020a1709071c9800b00730d0bc977cmr16716140ejc.321.1660040299377;
        Tue, 09 Aug 2022 03:18:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4LPB1/+wFVrZ71LAdfF/r4ll+GcieG29F6rnSdbjxBhAhEF/nHfgUFIx5XTeQBDbjvFZtcCw==
X-Received: by 2002:a17:907:1c98:b0:730:d0bc:977c with SMTP id nb24-20020a1709071c9800b00730d0bc977cmr16716129ejc.321.1660040299161;
        Tue, 09 Aug 2022 03:18:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b18-20020a17090630d200b00732a5b3d09csm705070ejb.89.2022.08.09.03.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 03:18:18 -0700 (PDT)
Message-ID: <7f2c7594-97bd-c824-9f3d-01514e6b38b1@redhat.com>
Date:   Tue, 9 Aug 2022 12:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Input: goodix: Add support for GT1158
To:     kernel@undef.tools, hadess@hadess.net, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, megi@xff.cz
References: <20220809091200.290492-1-kernel@undef.tools>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220809091200.290492-1-kernel@undef.tools>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On 8/9/22 11:12, kernel@undef.tools wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> This controller is used by PinePhone and PinePhone Pro. Support for
> the PinePhone Pro will be added in a later patch set.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Jarrah Gosbell <kernel@undef.tools>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/goodix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index aa45a9fee6a0..06d4fcafb766 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -95,6 +95,7 @@ static const struct goodix_chip_data gt9x_chip_data = {
>  
>  static const struct goodix_chip_id goodix_chip_ids[] = {
>  	{ .id = "1151", .data = &gt1x_chip_data },
> +	{ .id = "1158", .data = &gt1x_chip_data },
>  	{ .id = "5663", .data = &gt1x_chip_data },
>  	{ .id = "5688", .data = &gt1x_chip_data },
>  	{ .id = "917S", .data = &gt1x_chip_data },

