Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F8D48E0DE
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988803; cv=none; b=bDJiAOPXx6VAWpdOfAPCjGkn5UetbtsQJcBBjrT1TqpHEaD5tR6QjIr1CA5I7kbv9Kur3Jzzi3SCynYnTOHn5R5yKQm/az1lG2Kdl3coRM79PAzmoSMsi1g6k1gdPgmeZmBzdcVYCgttCnmIHGA6cEZmGGYj3uwCVrPWJy64+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988803; c=relaxed/simple;
	bh=APDQF13y/S2iTJC8bsCnwlXoIXm7Osc7h1xGKtGf/V8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2DhtAyri7/AM+GTE0TNxvO8ng+xgzy25UO7p5TNjARz9GTej63oGEioBb0Y+/8XxSiQ4LHPwJdeKljm9BbavGgPVyCrWUsjXEBsDwHaxmU//byiiZWMtmf/gbFROi4d6X/qe/fRLHCnND+UWx9TNJC/aj/A+lkqEPKzjzwl8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8W0TYh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alIogjgH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8W0TYh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alIogjgH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxwg1563459
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVGPjxP3QgcDv0E9g1JTcpUHcMxO88kzyAGTghYjz1g=; b=m8W0TYh/d0uyebaF
	/H4rugJm9UHLtaks3QckssiAtyDNBN4VuiPevXR9Djr6KzlTqNqN94dM756RqGU2
	NScRNU1R8rw6V6EHlfnol+na3tTdTl+izaV+EApchomVaHSztCRB2Gr/yfhGRdnX
	Iz1Bxp3qr3rMUteI4SEwqtGKT37Qq1B4D4Fs+UTQiElzZQ3vjCBQAZXj5XYxb/3G
	bkbPenBi2YQVunoAyv1n8iI4d+obL17oNt7c5GmCUW68PrvRGh0SxpJtsQVzKsjI
	Qa7UIn7jbSnyIy5kiKVrb9zhBs1CubhRxIdm9WvcSkTT/EP958vHElgSm5C8lIy5
	1aH33A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0y6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 11:06:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c84b0a43efso101258e0c.3
        for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988792; x=1790593592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVGPjxP3QgcDv0E9g1JTcpUHcMxO88kzyAGTghYjz1g=;
        b=alIogjgHTnDYsZU3X4O9nwBJ/dcD/mfTtZsWrYULgjIsTsd6y2XdOAywFhYu1Q43rH
         Ut4D/Xf2Uz7JJPv47oribEwHjtxtSOpi61ulaPFU8S/rWZLIUUWzMnRnCxy+2UlTu9tx
         5Dnx3xEgcoxysDuQL4ewOQrY+I8aXbx3yhbZRe5IeyRX6M7fbaDjcpmT5WnZmuvNZWce
         B2rMPo5AI7szT2fiB3/62MCQftpEjMdBedvjt+epF4IEwmVhy48mI0jFIiJ+B/dellcN
         030Uj6eSPwlnzM3rg50KwlronZggMmFNus1K6OyrQoZJ7PoE0VjPRErcmMK3L/Y2uG6E
         NgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988792; x=1790593592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVGPjxP3QgcDv0E9g1JTcpUHcMxO88kzyAGTghYjz1g=;
        b=q1iUHw6ZTAUG1PvoBvQjYfIcHKR1PO0hFvxbSSTZDNPgGzwbUq8a3B/4ohMwgF9Uk6
         fko+20NwOZIsCoLiGhG5vaoJ3QCsZdD5kKS+VlZY9UoAXQKOR7dEPgtjRp4a66mHtZGI
         +EL3vHktVTnQEXs5s7KSYrvli1TDr3t7JGaY/thWO3TzT3UcEMQsUE4UQxkANyONEH9H
         bhwr30xoHjTo+pyBhKoXPAnWai3Q3uBYEmAvszYRC+yrndnPd75eBrhHEwo6XQKk+1e7
         WTGv9E9ana9XRc7rjOo2o+NVbJ002MPw5RHiJx6xQ0JUitY+CpZIngtDw+ajRgv/qGOL
         33iw==
X-Forwarded-Encrypted: i=1; AKwUvBwtfU7d1sLVf2ngQaPOeaXkX8pqSULIqXbDvyxa6H5G3ZUuKTtcqVAwc12CgwL+sJv5vBrJZ1cS2LHcgQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nt+sBR3N2WGkvCADOrEHIjPv8MFsnbUzQp/gPZAwWlMaj0lsl0
	XuonvEIozWdvWkLKBuIgnp1c3RN9SatM84Ww0+UiAq/gTFZ2JctdSJYa6Nbj9cyyVJntMi7yY2X
	iZV9fcLxwjdxM4w/VMM4EN0Nhu9ZG5XGFKml8l73+vv+pdsmtCaS8ZHaTlqhoQIeQrg==
X-Gm-Gg: AYBFou2JnD0Rlvc/3HIuRk7HkZnzDJWMrPTKAXvSxCg1DSHSkW47FfAO3uisniCVRK2
	CJGj8KTrHkT8woWsohBMuiwfQitb5Jt4IeGmqopRrtAbWNl/Pw+foXiEq1xPE1VKALC1r4md1j6
	s0g5uSNvaX048BWE9Fi/aDqprPzii2fyzBTFD+hFuUudFhIeXuekRMq0doSRPj5MMsefV/ThSuq
	/FJXo0ZWePIEJmCPUs2eVZhuZAXYUmsbL2iL/EWsQz3uAdVdvHymKe9Pf+hAlR+BMaWxnwYu1Dr
	4hwEaTedcbbc2bBlW9pZ6v9pAw/nwPL6eZX6SE3P3jS5rFc7sOPPmbRe9RIEp9Y99hVnNvSf/Og
	o74aFF6EClcn17lyRIXnuFQ==
X-Received: by 2002:a05:6122:35c1:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c9bc3b53e6mr3524532e0c.2.1789988792523;
        Mon, 21 Sep 2026 04:06:32 -0700 (PDT)
X-Received: by 2002:a05:6122:35c1:b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c9bc3b53e6mr3524484e0c.2.1789988792144;
        Mon, 21 Sep 2026 04:06:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e1b7e1sm3810951a12.26.2026.09.21.04.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:31 -0700 (PDT)
Message-ID: <8204dd54-d282-4303-85fb-d5408cc0b4b2@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:06:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] backlight: qcom-wled: Fix NULL pointer dereference
 in wled_remove()
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>,
        stable@vger.kernel.org
References: <20260921-qcom-wled-backlight-v4-0-bab8c7ef73cb@ixit.cz>
 <20260921-qcom-wled-backlight-v4-1-bab8c7ef73cb@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-qcom-wled-backlight-v4-1-bab8c7ef73cb@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfX/NEbnzE6vus+
 vSCfBvlyhcsoaN3BByz7PzNkDKpVx58/nz71t6AkVgmya5Z1jR1cpf4afJxDWrpvRg2cqJDHJSm
 IAZTuDxlKxeX2kzxum3P1OXDw0PnVCA2w1poqlzCtM5K/SI+2tUx2lMQCR/AjvKv8W3oo26xP6G
 3YMLOXg7DuhbMUXQbZFpZX/HgMslXySKJCG80zMoFvxR2qbFKWvu9ZHTDGFVeGZMyRZfrnT3jE6
 okODOEvwEXGS67T3KcYpNyAY5m783iBgULSevMtmbmHSWXveqklsnnIEZxaVj1j3e01XFYTaKjT
 d9b/ZpZ6reT+5+BdpRClnOvs33gRHX7qHyh8tencUX1SMkNuEbijyDNPe7RGBv+AUX373NaWmua
 rN6AVrwVmD0/MpmLuGs+KzsuEBq6b+GnaUlQd+EpysxV11SqsgJuTfv2yB59f2uIWb0McuqJ1Im
 nmMuoPyrTcrkT4W0D7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2MCBTYWx0ZWRfXziS9PrKwvqrM
 D1T5GA9QeHAoVIK8fZj/YYPqdxkjpO0RHHcmbE5SfioEXhUCDXtuYBdkCeLc7GWUrKkvgQ3xMo+
 hoxji4DhaHdp7DYa3vnZyysyANBN+D0=
X-Proofpoint-ORIG-GUID: hZuGF_fPuQX6VB45CE0WWmFok8EFYyQW
X-Proofpoint-GUID: hZuGF_fPuQX6VB45CE0WWmFok8EFYyQW
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab10fb9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z8QxmeLbveigHahU524A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210160

On 9/21/26 12:46 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_probe() doesn't set the driver data for the platform device.
> As a result, platform_get_drvdata() in wled_remove() will return NULL,
> and the first dereference of it crashes on unbind.
> 
> Set the platform device driver data in wled_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
