Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5ADC433EF
	for <phone-devel@archiver.kernel.org>; Mon,  6 Jun 2022 02:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347872AbiFFCsL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 5 Jun 2022 22:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343887AbiFFCsJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 5 Jun 2022 22:48:09 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96524167CF
        for <phone-devel@vger.kernel.org>; Sun,  5 Jun 2022 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1654483689; x=1686019689;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D/wS6F2qtObb/FfuG5OxzP+ia1M5T+oSNe0EBUl49xg=;
  b=pIE8LvcM/2wXDFEUrH/68SGl8p+zP0tCOv1F3QkP1wlVr8OzF3V1u1BC
   N3lIOr0i6OXtxAn85+4jxuHDsoydu9tq37h5axpbHr7MPJ0Dw9ZMdFu53
   aZzjPBNw3zLf+Slo100rTk2xO8EuztX0TckYPO7VrsdhJ7RL8+IqwcbHr
   f2mH08Qw6Ab+5NbqFDR4u14F+QfuFZ1NTivSb4GbQYPO7ERSB4fCIR3Xv
   rjmEgzhM5INWK+VtE3zKXmiHPBk/O9kTCa16zA9rdMlzkLECMIp9JKXen
   sTfxBH+TdnFEs64Vinyec69RfVESqETzyrf5b/7cOWIOR0HasQd6MYrWL
   w==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647273600"; 
   d="scan'208";a="203119278"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jun 2022 10:48:07 +0800
IronPort-SDR: LndCPm+JWUhLD4zozE/wdqH6QAO7m4aIPE4tQ6y7MtFEoSwEsPiRWoXhtoldB+OqoH/Fs7INZW
 rLQYHm1W5WimjfSesVgGqPrJ1GFNhOEN1zSehOA8H00OA5cnCDwcDMYi+AD/xTyOhCXPhaP8f8
 V6+xONpA63m00NsmBZ0g1tX130IrEx74h7zjsqPiWSrLP1vnTCAjMnk0msFJrRLCR2n9AI54eQ
 Rjdw6FyXomLbvSIdSMOcwyWmTRnKcUsOrCmSb0d78qTMc8iGJ0N6IObzC2DpUGHcdpxoh5uNbs
 NYzHNxt0d6e1hulFPq/G0mIH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2022 19:11:28 -0700
IronPort-SDR: geOnPyDYCV6vijt1IKZmI/FE1BqZBZgbDwN8l49XLBgUv3UQReubR0GPjjsbajwaApc2WnxmAR
 vBQiPgymTLBwUYzAAtb+wMVM5xxsRuibF9KRjqEawVA7xwEjI7TyVtTizaGsKhk0eUA5nmefIp
 CWvhjZtn0Oc0MlY6bkK8I5PKdzoCFY4X+8m/slVn8Po0I3I6dsCIqrXceX2spEi0jvqS5z6akg
 fs2dY57HEyOkrPtrV7ISkx3mhloxyHwbFDi88gsPAu4/y1bGDXpvdzYS3iPZLwdSA8oBCzjU9a
 7Gc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2022 19:48:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LGdFy1Yb3z1SVp3
        for <phone-devel@vger.kernel.org>; Sun,  5 Jun 2022 19:48:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1654483685; x=1657075686; bh=D/wS6F2qtObb/FfuG5OxzP+ia1M5T+oSNe0
        EBUl49xg=; b=d3dlbZMa6gaY3hULhIWoEKv6PVGRqRPMuhOz0C2c2KhqPDJM6yr
        7LZI1PPTTX/14vzTEcmERaWpNWrjm/dclvcOVvQo98bYDCeEIH5fVWRAwS8HIjzD
        AT2uy8O9hWtwGGNzTd5GPvps3u2Q9VCbVKQAjizuCbGfdObJChsS5siq+/1hAbzU
        65yTiuBF0gVI1nXbmFB3KVOsto+2WXaodQlAZpVMdS+bBZ2scyPWZswunlT3Nw01
        ly94Vvpkf7LLdV9UURUrqdKsHT4AkgnPQZ2oBjQrmeX2Qj30sYcktr+9HYzt+Xft
        m2j031FcpSh5iHLlzEPPmeLUQ1eLoDqElHQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id M3Nyda8qpDV1 for <phone-devel@vger.kernel.org>;
        Sun,  5 Jun 2022 19:48:05 -0700 (PDT)
Received: from [10.225.163.72] (unknown [10.225.163.72])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LGdFt50L7z1Rvlc;
        Sun,  5 Jun 2022 19:48:02 -0700 (PDT)
Message-ID: <3c400db6-d251-c4bd-b019-b9dc1d807212@opensource.wdc.com>
Date:   Mon, 6 Jun 2022 11:48:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RESEND PATCH] scsi: ufs: sysfs: support writing boot_lun attr
Content-Language: en-US
To:     Bart Van Assche <bvanassche@acm.org>,
        Avri Altman <Avri.Altman@wdc.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "a5b6@riseup.net" <a5b6@riseup.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "~postmarketos/upstreaming@lists.sr.ht" 
        <~postmarketos/upstreaming@lists.sr.ht>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
References: <20220525164013.93748-1-a5b6@riseup.net>
 <DM6PR04MB65750969ACD36EEEB48374DFFCD69@DM6PR04MB6575.namprd04.prod.outlook.com>
 <8d25171a-5d86-9acc-0f94-1a3c6efdb360@riseup.net>
 <DM6PR04MB65752422396C86EAD4591701FCD89@DM6PR04MB6575.namprd04.prod.outlook.com>
 <a7f46ad1-6d9e-a38e-31cc-29fddfa2b496@linaro.org>
 <DM6PR04MB65751A3B1D0BA4467CADDA93FCDF9@DM6PR04MB6575.namprd04.prod.outlook.com>
 <a4746c67-fa74-8af1-3f2d-7853e9fae8a6@acm.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a4746c67-fa74-8af1-3f2d-7853e9fae8a6@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 6/5/22 12:55, Bart Van Assche wrote:
> On 6/1/22 10:05, Avri Altman wrote:
>> As a design rule, sysfs attribute files should not be used to make
>> persistent modifications to a device configuration. This rule applies
>> to all subsystems and ufs is no different.
> 
> Hmm ... where does that rule come from? I can't find it in
> Documentation/admin-guide/sysfs-rules.rst. Did I perhaps overlook something?

I am not aware of any writable sysfs attribute file that can be used to
make persistent device configuration changes, at least in storage area.
I know of plenty that do change a device setting, but without saving this
setting to maintain it across power cycles. Do you know of any such
attribute ? I was under the impression that sysfs should not be used to
persistently reconfigure a device...

-- 
Damien Le Moal
Western Digital Research
