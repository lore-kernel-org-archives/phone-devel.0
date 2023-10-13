Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF80C41513
	for <phone-devel@archiver.kernel.org>; Fri, 13 Oct 2023 11:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjJMLiT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Oct 2023 07:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjJMLiM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Oct 2023 07:38:12 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250E2EE
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 04:38:10 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so3437745a12.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697197088; x=1697801888; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeuzswEtGNcv7PN7p/vCAjwlSADLyM73/cH0LYcA47I=;
        b=ZmG025V4vsuxTVnYWAODi8mvbnl85+h9aWrAZT1KH17ad2i25YNQ/lktE+zpZUdv6V
         dNsnqA3Cwuxbf2V7QlNpo3AyWsZmkWi6UiezX4AoQnT50DexT3xX2mVSQwJqM36spO/M
         t9c13ciJUwGCVPbEreHdBmLjdptx78xcLSzv1QAXRkNx5M/pt8jfApSZHoGRJ4EZo7jj
         4Nbe3hUNqyXGMXWIH3PpkwqlNc7QtoD8qDPMNBhLC4lZHNNuwVf3g1P4fYIhZAk039aV
         LFxsPUHWx9o2lUip9BItNflyH20FX9/URpnrhyNUkDyRGkuKybguQoY6iYvRvT4DeJDX
         SUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197088; x=1697801888;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeuzswEtGNcv7PN7p/vCAjwlSADLyM73/cH0LYcA47I=;
        b=iqa1ZbTOGZnD9L4nbZtNBd5TWwJ5Kei1G5uH2Wnjx4tWqd4nqDfQRo/XNKHYXvZCOe
         Lal1VptK8k3jNm8uKPXFPDaQ8Vbm5zcAFFV1ijSB8+KIX9CDhGJlENELh9IYTdDD6G/8
         aHt3iqD2hchgh0wsam/EVHHba3rxh5HgJpCnC5EL2LqWIuDgLUku07m/dwU4eHfsmrHr
         kmrzdPeiFY6D6g9rs+HftNf5KOlGdUpTwD9kkuiEVqsf0R7khT8k1fjludDJmHECOAa9
         GU0TZJp9g5yvqzou7scxj5wx/Y1BX2yCO8s5XSCnYw4U89fPAa34NV6XGEIHkawuXvBM
         LQ0Q==
X-Gm-Message-State: AOJu0YxdnREqtizXkbLAnZ2Ll/7cGu/e9fJwhRraNRmx6NeRzCxUnua1
        guw36QOaByn4sEUS8O18VSCKzg==
X-Google-Smtp-Source: AGHT+IFkTEGA0TMga8AxlgGtGhqbCixlBZi81dfQxvPnWxxILoG3AlMI2uAQ2CNX7IniM8KJqIQCNQ==
X-Received: by 2002:a05:6402:3605:b0:53d:be55:3ee8 with SMTP id el5-20020a056402360500b0053dbe553ee8mr6667395edb.12.1697197088595;
        Fri, 13 Oct 2023 04:38:08 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id v18-20020aa7d652000000b00533dad8a9c5sm11360772edr.38.2023.10.13.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 04:38:08 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Handle reversed SBU orientation for FSA4480
Date:   Fri, 13 Oct 2023 13:38:04 +0200
Message-Id: <20231013-fsa4480-swap-v1-0-b877f62046cc@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwsKWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDA0Nj3bTiRBMTCwPd4vLEAl3LJIM0c7MUc+NkQ0sloJaCotS0zAqwcdG
 xtbUA2ylJb14AAAA=
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Short reason:
Without swapping the SBU lanes, on QCM6490 Fairphone 5 the
DisplayPort-over-USB-C doesn't work.

The Orient-Chip OCP96011 used in this phone is generally compatible with
FSA4480 but has a difference how AUX+/- should be connected to SBU1/2.

Long explanation, with my current understanding:
* FSA4480 block diagram shows AUX+ connected to SBU2 and AUX- to SBU1.
* OCP96011 block diagram shows AUX+ connected to SBU1 and AUX- to SBU2
  (it's not 100% clear though in the picture but makes sense with the
  observed behavior)
* Fairphone 5 schematics have AUX+ connected to SBU2 and AUX- to SBU1,
  which would be correct for FSA4480 but since OCP96011 is used (which
  expects it to be the other way around) the Linux driver needs to
  reverse it.
  If AUX+ would be connected to SBU1 and AUX- to SBU2 as shown in the
  OCP96011 block diagram, then no driver/dts change would be needed.

Not sure if I've implemented the best solution in this patch. Other
solutions I could think of are:
* Add some custom boolean property to the node, e.g. 'fsa,swap-sbu'
* Reverse when ocs,ocp96011 compatible is used. This would be incorrect
  since when following the OCP96011 block diagram no reversing would be
  needed, as explained above.

However I think the current solution with data-lanes in the endpoint is
the best fit and is also already used for a similar purpose in another
USB mux driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: usb: fsa4480: Add data-lanes property to endpoint
      usb: typec: fsa4480: Add support to swap SBU orientation
      dt-bindings: usb: fsa4480: Add compatible for OCP96011

 .../devicetree/bindings/usb/fcs,fsa4480.yaml       | 43 +++++++++++-
 drivers/usb/typec/mux/fsa4480.c                    | 81 ++++++++++++++++++++++
 2 files changed, 121 insertions(+), 3 deletions(-)
---
base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
change-id: 20231013-fsa4480-swap-9b0f76d73c19

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

