Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5401249E143
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399787; cv=none; b=ffbK6pQTfbe6WwiVcT1U65q0ibWgDi4N1E/UxQ4C7Bvlq9uElIUsJ9I3kXDgLV3zu9k39T3lbe8RgZF/FTP0M899jq/KjYOciXTqtZP6o4KOzVZ4Mgu0pe4Q4ByaIlRIyVyMkYrlVTw3HxfqtLfRuu5wDSlLv0cA5/v6yXX2InA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399787; c=relaxed/simple;
	bh=el2mIH0hwIB/4TcGc577stYSPzN1P7ttrLRnvliBgY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSG60HfEIkbPwQ204AXy7HFrFUKHTUgQSyfk5fnJhQ5Ov0Wu+l0kCtTjIj6DJqJgfPLjsqjU/1P+TwRUMZM7EsZx52Yq8SRMPM26ZYpGymOc6cWa7W2Zbrs6GgaOAgCxy7Bjd9bsJmvhUsDapYGh01ta2jsDQV8jTF+4FQg2ods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnPTN1re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0YM/0lN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnPTN1re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0YM/0lN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PD6O2193411
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 08:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=; b=DnPTN1re09jbjf9j
	HZUbnBhqjb9lgARjDOSqcoAeDvxqOM8fn2VvH7wAGB9MGb6ER8b6+/vJEuHeVqVg
	n4c+rMyNTScGNoVDSofhXvhVBzYAQIs6vcTfYO+CagHhqhJXtel4iTawkrvNmlgc
	olugOrbyWQ4TOUW8kimxFEjme4ySKRPTXPkHB9Z5nJgb8ow3L/Cpr9J7mrJm/d+J
	aFq8QbyiYHz1/xyWMuujNY885sYyg6QsAl3dnnUASYVwwkp2kxs/ZdpE7Hl6jIqT
	xyMbgzVnZEcGAnz6WsEZGLxJdgEcBTHoMiA9cp1Du2neBw6TXbqs5yi4jWbW5iZY
	RIj3eQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w19vjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 08:49:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so69514585a.1
        for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792399783; x=1793004583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=;
        b=T0YM/0lNb+2IVdKhYG3gT2E0E2XbHgpjZeJ7Pmge2vagt22z2Mi7u/PWcQVx4UJbGe
         KiuB8OQ3tRyasT/sWiH1+vyfAa4j5fKSk9ENyMrk0yMdHdcpHBjHvLOnY7YL28YXkocH
         iQtJNGTj7fT/BMIaVqAwzI9IT2N219OvTyUuDiTBOBC81KT6prCH0CHuJvvoE4naMOte
         w9Naldet0J0cwHaMN1UiscWebfieYiuy0+NuTxwTK14UMiPPrAASAVsERfdBlJoEvfV5
         XwAwXzOdlyufX0h133htLW38pR/A7Dx1nUS1XfOLQRoAUEFYU2nSZUdXwQ3VQvBEycPA
         wW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399783; x=1793004583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1ZBQo4xN8AstRqTvSytS5D5nyrbvYomjv1K/zet3jM=;
        b=YwXicH5m8O9MzkWtmgk5OJVyLm7aGfx+K7fAzu47dbJmMfyXrE/+pJxHG9ggJNKvaB
         w4jV2ia8ta3ETkKDTFQy3xIRg30hU3jkO9tpuLH7R5r3jzc9NjmKxuY2Z4c141FHPls/
         w4k3aFdB8xN2H7Ujx7qX7fw/5ccdExd+HVe8IJKhrqU13htNfzRb25roDEaXDJrqJtd9
         B8yJlUyq9BrXSu1VkE7KADBuHtDHJbFhibG2yeo/ADqJe/UcaVZdGw70WPAMc8AQpI0p
         WrtFd8WITlin05MYr21zieA0PdErNL6VvzXMJKcUHUhl31xFdANAPszrAeE3bsKHzChE
         5W7w==
X-Forwarded-Encrypted: i=1; AKwUvBx96U/DFM64TB57HFEVK3fvPG5yuyWVABgSqkzejmYSY3BFAWPIC6xSwz0igVNq41tBGTKpOC86YXjcqA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhVk4+pdm41cdcLPa/XkVEDEck0vCwIJGkTl8/M94tA9fgT0OQ
	yKGAzY+5NY/jdWE/otMMur+uitRAyUkZwcNWhqkUo3wO8WSe7H8kSpUhgHvhtPFPQZHRia2L/5E
	jAwqMJSdvDQb/zI/5AsYLtitdkKPBFnkJx/Sj+U5IlsxHLzbxCXlzfP5p3Vh8TH+FHQ==
X-Gm-Gg: AYBFou26XNHG34TP7McytRJGtdrVGZCooZUFEiGg4CzQK3HyLfgOxzmxeDdAUuFWhVs
	Dbd0PsRZ/SYYTEODP1sa3Fjc6iAVuLm1bbc3tHu9lM2RErTuEzdhQeuuukVFzz39IkxXaWj4voa
	+PAPs0d1Cd1osl1T03Lg8Z51Tl8f0BjofrKALWwPTq2kPBhLG7AxsE0sWQVUyg9CcRUF6/GpPFa
	fQpdUfTCoC9XCBXktq1QBO3Jxft63sBQTwWOqF94m/qtFKl9YGOYL5f65TQlUciVsUV9DrMunfj
	5QW3a3Rnc6Z4VS/uq9J7e6bTi0fWF1JNw9CIgh1ixDOYJxdoQ53X30lql4Y0j+spuyvJ/lJ9Iay
	+FYD7lyfqrIP3XGQfqtkMMw==
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1411375685a.3.1792399783392;
        Mon, 19 Oct 2026 01:49:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f29cf1c85mr1411373785a.3.1792399782856;
        Mon, 19 Oct 2026 01:49:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd3190sm347944066b.23.2026.10.19.01.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 01:49:41 -0700 (PDT)
Message-ID: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 10:49:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNSBTYWx0ZWRfXzNHziABoU4jv
 7wMgaS78RUdyM/mKBxsGWhzkdN4HjELhDhEHxQqN+GOxsxkwxJcxGPThPqGJ/9te65VR+iNScYx
 3Fd4Bt/ERmhaoV/DGIZWcDj++jL6x40=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5d9a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Rxtn_4jyFG-xpNbExEYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNSBTYWx0ZWRfX5QBprCs1HF9Z
 +jZ1sLvn1MFEtoGYCdHoPMcbrDbArVy0q7Praua4Ixp8Zx1iI8A7PC/6fRCXE/CH6SOdu3ReSis
 q6NdCQ3pXUvYK82qVBY3pCxhD4P9cs4eXQlu0H6wktAvwB03DseHKT56O/KBLinpwhu2So9/jbA
 Nr9WNFr8BL5AeGNrM/IC6jZxbtB1fB3B0ltwrcTRLbwQ7zvQy6A47s9/PUr3u329uMi0WkYwQYA
 Zld6ED2OoHbnL1k5c1Icy58XXF5Wt8Afr8ar0H7CxzdLdnoPnloJpnsmsYY6zGqbWy+XZ/nG2bZ
 btfNZ2KfAAnAqAE0r3+FouBmIp7M1WgW26qNCTVkboskz/NJkrJljoxtewavEmlY96Hv7EgfhAx
 O2ooWfbdhM17CQVg/V/m7G/IewT/mzSXAlhsDCWZT/pmRIfTDjSSsgpv+q43d8FvtLjkrucjT1z
 ugSinv1p/zhSKynjB6g==
X-Proofpoint-ORIG-GUID: Yx3CFxWmvx5r5Y3SRVreJwDlrpUvFpMC
X-Proofpoint-GUID: Yx3CFxWmvx5r5Y3SRVreJwDlrpUvFpMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190035

On 10/17/26 3:29 PM, Erikas Bitovtas wrote:
> On 10/16/26 13:56, Konrad Dybcio wrote:
>> On 10/13/26 3:58 PM, Erikas Bitovtas wrote:
>>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>>> in 2021. Add initial device tree for SM7125 Samsung platform with
>>> +&soc {
>>> +	i2c_17: i2c-17 {
>>
>> This is not a MMIO device, so it doesn't belong under /soc
>>
> Will move it to / in v5.
>> Have you tried using the bus through the normal QUP driver path?
>>
> No, I haven't. GPI DMA support for this platform is not yet upstream.

It's a copy-paste job, try it out please.

>>> +		compatible = "i2c-gpio";
>>> +		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>> +		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
>>
>> style nit: (foo | bar) instead of (foor|bar), please
>>
> Will fix that in v5.
>>> +&usb_1 {
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / DP altmode?
>>
> I could not find anything that confirms super-speed or DP altmode on
> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".

On the stock firmware, if you plug in a display via the type-c port
(perhaps via a dock), does it show video output?

Konrad
