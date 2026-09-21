Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629794718E9
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982860; cv=none; b=TuQB9uy5JqY1I38IQCEaqVpwP9wRTkcrDbTzPGIVh5qFxxufcXI/d/gfAjPTsul07HK1OYZN/2aOY0Cgh336CeRyHdoRyMnKeA+oO55sXeQ4K/T8bzN0y3M9QcxsP7bylN87GOUCiyKDLCEtWmLoX7g+f/tumpvFwluPzzPtGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982860; c=relaxed/simple;
	bh=N7Bwiz8vNzShNEWWo1hbEjNmyTi8IpUXmCv1WVc77gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZ2SO+6ek/wf5fRo2kU6mYQwShoYOIOh2b2uBCyinqoFAEMfET5wX+uz0n7TzrjXASjf7hIjAv/gYz7BEyJhsUhs5XHwmGC9Tal1stmMxdxB3DXElA9zegXYA6qF43dOo4ew2NBRfDw5PAEpOWDN0OoeYn/bD+M8zYLMBImGa9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emtK+myv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPFTvmwg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emtK+myv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPFTvmwg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L8abr34146823
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 09:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=; b=emtK+myv3usdP24s
	OllM6ZLLActmbGIWq2Dsd3DlQZsIk+9Zg4RY+DSIH1KzrEkwP0XtH1p2heGqZwlv
	hpc0RnbFu7RCi2ETWJIXuctcgK2Y9r1NcaK6fb4kUTiH5fGyFpBZEQeJdzgz7Uou
	sCI2F8YJlEVkRJwCU3vUrIZx52YSEZhasX+1wJc0lrLUpku7pDP6CmtETVcFeWac
	CPPIuKYW2Q8NlxkjUPZ35ukMIJLzOZEfcwfyrWotYX/6/ve7VXvENjXPXqkbMYvX
	RvgdTpNzG8kv2GO8wTM/Fn+2qFVYzv6Pf0mD0kfr1EvKeaqb4RsRoiv0GKZ/8/w/
	7ocMAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gr7hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 09:27:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bfa443305so42825585a.0
        for <phone-devel@vger.kernel.org>; Mon, 21 Sep 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982857; x=1790587657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=;
        b=JPFTvmwgPbAmq/ddV9qE6qiw/GTc4AkFv+KR/iLmZNC19sBEwUSBVmaO749ZL/xg+k
         8NYI9cAoMk6ZcuKSToRn8gfja7UgaWHla3Lt4PU3egU0yCVLRklMKOH2umeeEF1El7PV
         7E4acvbTTIEqEUOf0yDsiYMV/NZ8sFLslnE43ksnxc2ixA/FXGKwBKUSc46M7Ek61hyP
         HpCJJs5MHeW8OYyFQFENdYEomzHw+jo4aGxYloD2D9QOtdO/vczCzjEIa8Eb7K0pdex6
         DODiOjeGhLzBnK6Yy08alJYBpkc9JZ31Kt07NVmiv6h609ATga+a2/f/9HBNmB2CYXSh
         ATew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982857; x=1790587657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y9zQn6vdVFp1pIjeU34Sa+AThYw+cYdoj6+lWv6DoI=;
        b=UFDhe6Wko4tmgI2tl2Hi6WpGToA5V3uoJItGexi3VgU+3xLmuOWR5OWGFJGRit+2zf
         S0uSP2akvQjWek5uEGkmgCjZUbY74fZFdgkCnqVNpOHx/MzmjfBTitIAHMfgXcqLlWbU
         YZVP80vM4TvvKagwPzUD9DLuW8LZygvf379uw1gK5Ua1hytbouPBAgBOnf7kSlPVb+/R
         rIKaLs3E/lBvyMlrV9FfRI0I/ti2DIsDBJCNUnLwdfm5wtIxfggHwXbbIiPDrxQiRuJk
         ofLAYMrnayjB8gBGWbw968/W6G80DJVoyp0gM4GaHyIyoiGec5tbyY2hR1kr/2tqWOz3
         xYtA==
X-Forwarded-Encrypted: i=1; AKwUvBxZp7XxWXBfCo0eIwCejw4+dX3e82P5djHYRimFt8qv8VIfwAVl+NYLO8E2rDssrW19ZoSOv5LlyO0aOA==@vger.kernel.org
X-Gm-Message-State: AFuF++lPbXVlpAkglFQ6zgeFzqepnVSkRuPgX36ykB1fdiGPQ0+P0pxp
	1OHHukC0gE3Kqdv+xoSV+3UYbE2GDyAtltt3iiW3mSTkrIKswxbAULdU6iivLf+ldjzo4G4jeW+
	/EFiLlqdhfhPIpweQPrOqlQHpOkglPRc0JyQc2G1iwuXN9vvyJTPHbPyc3LnD77WBlg==
X-Gm-Gg: AYBFou0IadvX4iAO9pXRV5TjcA1hIZEA22BiuP6VCG+8rJ/lsT1qjX89Ntr3L5sSbRW
	STprzxGg51QIBHp+cRCMo0ANXbgcAIkemi5hCvNc2L32yt7BUipXkE0gMj48qBFxVHHRbGyVmJ5
	ePoN4xmEZj6uzvTgvzMDWxQ7r4sJ3l+kDkgU0cvdV/ff06JJpbB5YZbzJZjl2q5GWZ/CPwyaUeD
	lKCvLYEHP9dT7zX5RoVshNH3NTHSZGEQvshsuKpfhyBXrOdkuqq5omH+ZtqYrZ7rqoRGBB3Z7Iw
	K34Y4KvErcCOWCUeorjAzyDXFCO9c4X+VrWN8Kv+DZdN6TA3awyBEnbTDVPMXzP3yVJy0qW/3+3
	9/FALWH6/UddExCSd3uypfA==
X-Received: by 2002:a05:620a:470e:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93bf574e359mr981020485a.3.1789982857293;
        Mon, 21 Sep 2026 02:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93bf574e359mr981018285a.3.1789982856852;
        Mon, 21 Sep 2026 02:27:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3573ce12sm276656166b.35.2026.09.21.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:27:36 -0700 (PDT)
Message-ID: <989c8883-c481-4132-b6ca-3a333aa0788a@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:27:32 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] backlight: qcom-wled: Fix NULL pointer dereference
 in PM callbacks
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
References: <20260914-qcom-wled-backlight-v3-0-d69fe9843841@ixit.cz>
 <20260914-qcom-wled-backlight-v3-1-d69fe9843841@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-wled-backlight-v3-1-d69fe9843841@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XZCMGs1iBKMjbayB3ST4PNLeZEZyTAat
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab0f88a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=WGO8Zn8UdcYOddqErpsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNSBTYWx0ZWRfX7oYmHKRDnmPl
 6sl3SDwFp8+7cvCLWF+3oGvoLMICsWBHRjj3sfCMv+ZPc92O7bJOx3ZYasyYSo53fl6S8pYdOlo
 1l4P+fR9rTzDVHXktEnZtr8yIb6DreD4Ja04DOXeasp/9elIlVL6OxUaPZ07GXS0YeC/hSBjGqy
 klHmRP4vpW0Bp7F1nIsA5huDSzGZ2SCnFaGTozIHzGZCRXTJeR7mvWtZWS/2PpYRPgII9nDrqtk
 1HZc8FIHzAu0A3ZkY3M4N92Jig0pbyfVKKJmCfd8qs8PobbXYRsh8hPYmfTIOHDp52hHOb/fI9f
 o3v/Zat995BsXg8GmBE4CXQ3j1XuzFKe/AY0w3bSO6XQsDxS3mqq7QOc8cs9LZ50mHpUjqU69N7
 +1ACF8nZCWii3Teg28HA2fA36+zVwSJMpxqFYoYoPaAi9v/M6CR/l17bhJ7I99332KY/rceTMCn
 /vWGkU2tYyfa4TdJV0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNSBTYWx0ZWRfX7rrURJm7yypY
 myURpHsJFEN5zPmnK9w3hG88f6W5dqn6SPOo+4+gX4E7YvhXvoC5iAdvDrT5F1oi3hl1ct0rBY/
 El2miw5gzU2NCe7q28JNg0gjVHTU95o=
X-Proofpoint-ORIG-GUID: XZCMGs1iBKMjbayB3ST4PNLeZEZyTAat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210135

On 9/14/26 8:14 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_probe() doesn't set the driver data for the platform device.
> As a result, dev_get_drvdata() in wled_remove() will return NULL,
> leading to a NULL pointer dereference afterward.
> 
> Set the platform device driver data in wled_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 650dd95f06ef5..a76158a298335 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1747,16 +1747,17 @@ static int wled_probe(struct platform_device *pdev)
>  
>  	memset(&props, 0, sizeof(struct backlight_properties));
>  	props.type = BACKLIGHT_RAW;
>  	props.brightness = val;
>  	props.max_brightness = wled->max_brightness;
>  	bl = devm_backlight_device_register(&pdev->dev, wled->name,
>  					    &pdev->dev, wled,
>  					    &wled_ops, &props);
> +	platform_set_drvdata(pdev, bl);

This does make the pointer non-null, but it stores the wrong object

Konrad

>  	return PTR_ERR_OR_ZERO(bl);
>  };
>  
>  static void wled_remove(struct platform_device *pdev)
>  {
>  	struct wled *wled = platform_get_drvdata(pdev);
>  
>  	mutex_destroy(&wled->lock);
> 
