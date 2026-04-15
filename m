Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE622538F
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243686; cv=none; b=gm8Wb5FN5gr7SkcqdAaxDMWahjcTjBA5IkXAe/9uz7sNr2dFqI5ISI9Xz0hQum9AgsYC4V/UJD84+bBPxf1u3IGszp4G1XfabDMacm6l20ND7TJqlIIhAuvywX62I1Iq68RN8WWNHUj2zdE5IIxC3g7hd7/20FJ8CIyqnc28IYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243686; c=relaxed/simple;
	bh=7KpG4UWdwvqu8v/T88YZbQwzeTM3YOeeINseHlx/R2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t66vrEoJ380TM0auz9IaSRaszRy3SIA9b0aFGePGcPJOG6hXIj2FUa3xR86SAZM6QS0QTAnCQGZgYdRgl40mxa2nNUdJ8y4mTZKQzxZzrzV7Dy68Ub27HuimkW5kSeZFdGtf3dPcF4EKJPJV6twwXwKbqXDHRJK+GZx69cwMYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5PadLOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWBDldZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5PadLOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWBDldZA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4JjDh3059073
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 09:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ily7UQnWme6LgkWcvBf2LTy57LIttXFhiZpYV11UMT0=; b=C5PadLOnmCLU1OGK
	wiHu9r4UzlUpR32Vhu7XyAqjSI5KJSrFvkVP0gLz2uY4BiGuRh8Q6OvZ8v8d2dfK
	ESJHHAga7/c098jyjqh0oeA0mxP2AxNWmQ7DAGpTHl3VAWEnOTL2Q+RHryXa25j1
	KdQFagRJVSADbWhZk1FmYzvkTRw3l5M/EPwjEndiOiee5KBSFbFbiNUe118OU+hY
	YrlvVbPlsE/0ySCB0uzs4zGLP6HgKb/yNdueW2WXSlUNSEqcMK2YTiOkiW85eHKA
	7t2lRAfZ+cAgPgKMxgNNNG7+KNAZsu4Xq2Fth0CSQyOf+aZeI0cEhfbhBJ8HM1rW
	nxkqGw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhteptfv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 09:01:24 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9569deb349aso136692241.3
        for <phone-devel@vger.kernel.org>; Wed, 15 Apr 2026 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776243683; x=1776848483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ily7UQnWme6LgkWcvBf2LTy57LIttXFhiZpYV11UMT0=;
        b=LWBDldZAnYbpSM1vS6qSelfQ2dc6jQ+Z3MKR6tjO87HeMclsyy6LdB7VGB5oO4lqCz
         wZeVHbn/CTtAtNu29bwUxVc3l+U6Ql2a1WLTO9nat047HAlgZpSXfg8LwC0yMB4ACznY
         CG7TwkZrxTG+8QTFRFaHQlBPpDRCgYLfH/bHom7yWY6bAFCCjgWkktrB98XeJK8jeVDg
         klP+V1dPhPA2iqeAOWP1+izW76lJfT0sONlS6kyqtogGa3bSfTEoQA4dUnEweQhBTgEC
         TF9I02qyToj0IoqMFQEN1AIj/YWD0ZX/JoSy02B9PuuwfrWyuKk302OtgRJ3lpAiHROK
         JT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243683; x=1776848483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ily7UQnWme6LgkWcvBf2LTy57LIttXFhiZpYV11UMT0=;
        b=BaVLkxhHFkySI1Jhh5ikcifdqp6nEDV+JJyx9oOjbCO1iohn0ZEtmm/3oR+6MBShG8
         Y4UOrt6MUv3L3VZxILN6ikoEw6eMNgA2NTISZG6syRoY231rUb+BDTkprdvNl2D1ecs4
         Wam5nUA/cgN/eCcb/Ege08wKJhCfPRlK39F7GawEK7FHTZ4oBOYGxzM8Ra/StLtzZSKm
         SX5GfZDl4b3tujL04IyjOTGbCeh6y5GDI66LOrgXXIod7hjd48SkPl3tfFSzd35plgRU
         bQdwTdmwbxPyKFIDvzb983TUM4E/0u1wqn4OkLZRJkUSrcSTk2UPZUUzMZ0CZWIw9Ce3
         nF9w==
X-Forwarded-Encrypted: i=1; AFNElJ9ABXuUfwYETN2Eg/FNPDqRXI2thyxzgIgiVf3tOUoVkMbkH7OHENzxjWHfyXQO+9dguGXnGFUmpKl71g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyekYOQehDyAGfoLUbZQTtey4IMJJ7WNth+hHrtp28TEr9RSjYG
	w8L+oBwfc1gWBqSkRfhufjuwdMbRlytFPuEKe0rc4nh7/h9ntX936gQn5vmfEZDxSD2AOBs19P+
	2VriR5czujVoUPvfnvhDQVrMgC6ChsnIg5XGa1c6hrD2UbgngE5rTazZg2u9FmqG7OQ==
X-Gm-Gg: AeBDievQZdb97qhEjJE14zRwbUb9xXGu3yhaRQBwA5GNbWr++q/EWwfk9gUH30MtXWa
	35uopql8cNFRwxnoQmccf43DefKI8kMzAiEw/GsNrYFMiZBfYWSZopnx80fzxqxA/uCl567aXlR
	NzQTpXrBywyY7aBYrMWwIjNa4RgLShixbsIU6En2xktW2uav+TOH8x4U4lmK+qhsc1U76akA5fK
	HJuHeeIjTkb1QzJ9YC3zOJQxirof4/d3YlI9oGroRiyLhdn+Tlsyus3VuEyi+5BmgMYM+6NE+FW
	YBtX0UqcIhVb4g4kFfymBZL4iU/KFCVSgLWDOZzRmajnXd98DrPg6bTDAjNTFv7bcfUmeXfoa6f
	mhrzhkMr3y7GEba2ltp/lgOqnXb48Y1AeIPpqdnbbtSrd/8eepRzUKDvRiukxeYlEYdjPojlqoG
	jPIIoP0FglStr18g==
X-Received: by 2002:a05:6102:114b:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-612b8128344mr154469137.5.1776243683398;
        Wed, 15 Apr 2026 02:01:23 -0700 (PDT)
X-Received: by 2002:a05:6102:114b:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-612b8128344mr154448137.5.1776243682984;
        Wed, 15 Apr 2026 02:01:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c4e57sm35068366b.47.2026.04.15.02.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:01:22 -0700 (PDT)
Message-ID: <9c76480a-2586-41da-8dc9-37caf0ce9b7d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:01:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916-panasonic-eluga-u2: add
 initial device tree
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260414184429.168612-1-linmengbo06890@proton.me>
 <20260414184429.168612-3-linmengbo06890@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414184429.168612-3-linmengbo06890@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mMLvMa0y5Jhws-EJOy5PsIi93LuZp66H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MiBTYWx0ZWRfX41fhU0xULPQb
 a82uEv5/iX+IcDemylZoF1yhG3Bz13VuR0U1TEaDBcYw6mJ7Qmdz1qe0fUcfF3V+Ro9F5nf4FB0
 xGp2QRhcK3LeFNo218m9KUaR4ACjqM65uPckhIRBoDBw44yf+ZuoRp/5AmIHYyTpx5i3wKbpFSO
 8k93Ooq96d8FlY8fh43Qa1IaZKVlizq6ii3txx8UQUEKurwIVFohyt3Y7zDgIO1Fv7IH3HhDFX8
 xKOIF+KmZztYmNo8eXJKWUuG+vEqf+cBhusbQNbFU1j+uOjyXSJ8Ua0nu62B+2BIzwNf3HVs/Ff
 +e1kZpbCtwh0LeiJkMqlkvddPezJzjvvDuCXCRqQ1yz5zGc5cJ8ZBWBDgj4Hb6T/scmqQMrIAin
 GxWdjMD7t/4fDfwymkmN6KhBzbbuXsGoGNwE+0IqOnww3dmu6TrZeZaw/b2D26iYqo9H5xl1eKL
 iRHfEQwRH+MzIVsQLAA==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df53e4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sXHwpbxk8QKxrbsP2dYA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: mMLvMa0y5Jhws-EJOy5PsIi93LuZp66H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150082

On 4/14/26 8:44 PM, Lin, Meng-Bo wrote:
> Panasonic ELUGA U2 is a phone using the MSM8916 SoC released in 2015.
> 
> Add a device tree for with initial support for:
> 
> - GPIO keys
> - GPIO LEDs
> - pm8916-vibrator
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART
> - Regulators
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---

[...]

> +&pm8916_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

nit: let's uniformly keep a \n before 'status' across the file

with Dmitry's comment taken care of:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
