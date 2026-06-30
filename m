Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A1403EA5
	for <phone-devel@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819833; cv=none; b=YWTW/eCPDDFNDQLy54GwOTItoN8EhMMerSRhAf/wNiLFCDe/Eo1lQ8gjDnhzj4RFqk9Ajl6mWtDxlEkju8OPzNg09nfww2V/HcJjLOcF5+4reoUtlBil0190dCKgUKEP0rZHrvsLV/QOT9NfUgCFUiOMVikXUyxifWBAMZDR7dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819833; c=relaxed/simple;
	bh=ydxso3tQzTPdXtcvGFdCqB1x6Jr03cYbvaMFGBrRqxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkfO7ghrNlCfAdeBM3ZbPYHLNCXY34sP+FkNP1KkNLt0u4knI/SNVD2Q3T++xSBbJ4lVGX66cEozPODH10ku5WNjVjdmlAldbGMP4QGJj9IS0jSfE2lzkzmUkTH/06L7KjYPh6sQ9TiPfeARkHwQ7YNYRcFTiKMmwVmM3qeV8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0Rq5OHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNmdRs8/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0Rq5OHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNmdRs8/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1Sh1573366
	for <phone-devel@vger.kernel.org>; Tue, 30 Jun 2026 11:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=; b=d0Rq5OHcxH34F+t2
	luWaixD9UWj7vzhGYA6kxXL+JJBPzSmvjx7PMBdI3LttHL5XGZGliNh/m4Y2BuH4
	tjQfbD8CjuqpcTy3oz2zRFnCcvryFpqDMtJ3jGsq2F5/kxNk/3fFGmJLJsbSTlD4
	HHFCjdYQF6e8gvSVPdwKKVlrBl+Iv43I8jaPVFLSPKQc5Gpacd/F+e0cByxLxgya
	cMCCP6r8KgTjQiJB2UEXaJbyl8cWYsewsO9mizSdpbqrF0nw049GkXyb1lJ8A/pV
	1Gwkr5qjs9VV3xBsJRnPbwpdKn30Mcj+B5Kvlcx9Nybyb6Hm1x2TMWnQ4Fl8eRAe
	htS8tQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862071-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 30 Jun 2026 11:43:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso32705585a.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Jun 2026 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819830; x=1783424630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=;
        b=BNmdRs8/PyYa+oAZWRmtrp5PnQSCOkqcWArZ1b0ZnXakrM5Rj8sPDW0Bj5SVxwNXGa
         9QXMXRckW5xdyMw5CtT+cSID6H2+iPM47Edr3KkkEhcJmHukekxzNwOTIfP9haQVgOZ6
         0uHM9SvafC95StRAf4h1lfUS8MgP6/VNgjCnrrH9neBvcjrk5qBEntLqmjXMLv+g7fdg
         FqFB0i6HHOoWC7XOnEa8l67NaUVjUJdmvUCWx85WV15VQ85eM7c+FAySj/9WGq9caRWG
         0W8AgB0BVDChzIZzW/g23aTVvk+InWYnRm+DRPmno3cZJtOKH/Ioi1OSKZ/aoLZ5aw1Q
         iaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819830; x=1783424630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=;
        b=XSRkjxvnD1uYkEl5gb6q+3Fg+L4UMnRwxYQ5Nx6yDMF7vsz+OHHFunIFFEVd9BHbmI
         dZ20KcpgF+VF45gnk+v0FyKxKhWn+4sSBvIaiHAvvA3CvZ53NHymcTFafCkTkxi5AWWh
         slcxB6vM4SAGRs0sKfk7YQcNh7rd8gM2LhQjPPuO6i2dUHqZ0SUwYaXevZpNLhXpvjeO
         3TCIcCshLWJz2z0iHrHfr2x9KgPAzpc/sKPQ3CMyL3IALGoXp35EcYdi0hglc60UiV6K
         vtk8AeN/E5pMKS3S+cyioGDIHASovF08PmIP6hf2+XCNlBxzKLG0vi+J8UQRlx+1yKpr
         Ea6w==
X-Forwarded-Encrypted: i=1; AFNElJ8VyI+koOBD9S6CeN/kesc1sE+o3grSBumL2zyXrx4gZ9LOBuhg1kuo2Z1ImyqUN5XINqbKkFRNMvTPRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQkT3I0yYT+l7M1S7db9ltX58BUxMm7sfee/xmbONJmfZHEZ4
	etpjSeuBaWLIMQO3xRqc/s1GnCvd4UMYu5suCCx5DzcCsVOPTnrxMcUlycjWMyFMpYLYaRQ9034
	Pt+gswhnrONq2n2jMzfBlNz/A9NVivBg43ZLezRYh3YUlyWU52b8q5fK94dDLqGzxlg==
X-Gm-Gg: AfdE7clJV4AsDDlJ3X66/yg09ABI8tgNBg9kp4hShdSSX3o2xpVCxkeIV7b1cY2ty2U
	XSdvTvvH6hEhUdphd+sE9QyglalnmqPk/3c+wx+Rf7p61UpC4oRHd/EO70bJwqYPq/BoyORTqEg
	8HYVM83272cpANPw5YHlm5BxG39lTZ9ogAiDKP3Mf3ectSGlTNrp8pNd8qHoLdvaxB1JoDteQxs
	lQnoz86VVeaz5EeK3eSad+rIFzbdOOEj89Ve6hvdBhHqjeanDfaFDNTr2D7vOzxPR4SgQT2h0kq
	NXacF5s9+Vmn1B8ZoZljOdb0aDRu+G07sxCRwAJfwX6vbiMMbntjegP/RPnJZyR3qOtftJTmWpa
	aAUrHVgkMbGuEMWkSZZgkBUW+CEK7qcgeCfY=
X-Received: by 2002:a05:620a:1a13:b0:92a:d546:ba04 with SMTP id af79cd13be357-92e62620d05mr347160685a.1.1782819830015;
        Tue, 30 Jun 2026 04:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:92a:d546:ba04 with SMTP id af79cd13be357-92e62620d05mr347156685a.1.1782819829433;
        Tue, 30 Jun 2026 04:43:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm113653666b.6.2026.06.30.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:43:48 -0700 (PDT)
Message-ID: <1416ada5-ccdf-400e-b2b8-d2c5c7e335dc@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:43:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>,
        Alexandre MINETTE <contact@alex-min.fr>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
 <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
 <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FeBApKeYgYpgnXV4KWTn4BsBCO8SoEWY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOCBTYWx0ZWRfX17AqT9I51VNO
 ZHgOVTgsWrW+k9JCpX4Cw9gTPekH210jur4cSeRgVw4VmWG9sEl/oIcXOWDPmEJw1BmagcEGDqh
 q8q2eN/NtlnktU8BxL2rLuzA3AP/AkRIrZ9sUJL/yRetROQIStHdFle1p05MnhRAjgwha0uGTS+
 HeZRdYAfpGERQ7YChvd3NtGXb0wlBbtIY6bAlktT1bouuvpsP43bljZXbwsff0hqH9eMl7k6Zt3
 dxtrbknvTdQjp2b7VDareZ+5bN1dHYiB0w7FReif/Vl8X4RsNeCCJDx6WDxoH8zMfcnsM15Io8K
 Z4E8UIc4Lrq6xDJq55U65bGl4/YTzZlVaukKL9v0gPewsgxMDjquIVzbf+dypQQxnWre47HyBQl
 KoOina4lqaBqTmFYVXbCJTeGM2wT2EWp2w20QLxTL0CyeOckONPgeUUcD/TwG9A9fmBXQtQlzMD
 0S5jBmx9R2BCuINn8Cg==
X-Proofpoint-GUID: FeBApKeYgYpgnXV4KWTn4BsBCO8SoEWY
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43abf6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wxLWbCv9AAAA:8 a=iVYy-9Xbl0-MiRC387cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOCBTYWx0ZWRfX0WlozcgzZngN
 umAjgURF18VQa+/uCGpPs1klbK1K3hUFcfiKjfGOzSGvJLqR1dt5/Qsr0K9/Pi1lRs13mfUtGsM
 uEwtSYRz66bBly7yOaDDZX/JAoFVFRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300108

On 6/29/26 9:41 PM, Antony Kurniawan Soemardi wrote:
> On 6/16/2026 8:43 PM, Konrad Dybcio wrote:
>> On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
>>> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>>>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>>>                reg = <0x12500000 0x200>,
>>>>>                      <0x12500200 0x200>;
>>>>>                interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>>>> -            clock-names = "core", "iface";
>>>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>>>> +            clock-names = "iface",
>>>>> +                      "core",
>>>>> +                      "fs";
>>>>
>>>> The bindings change you sent changes the expectations - "core" used
>>>> to be the first clock. And I would guesstimate that the
>>>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>>>> ratesetting on the other two?
>>>
>>> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
>>>
>>> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.
>>
>> I didn't notice you're actually aligning the order with bindings. I was
>> under the impression this was a random change.
>>
>> For the clock assignments themselves, I think the schema reflects a
>> full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
>> that we should have:
>>
>> - ahb (bus clock - perhaps daytona in this case?)
>> - system (core clock for the thing, >55 Mhz for compliant HS operation
>>    or at least 35 MHz for any sort of operation)
>> - ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
>>    in our description)
>> - inactivity_timer since there's a BAM instance attached to this host
>>    (possibly handled implicitly)
>>
>> for the record, there's 4 hosts:
>>
>> USB1_HS @ 0x12500000 (this one)
>> USB2_HSIC @ 0x12520000
>> USB1_FS @ 0x18000000
>> USB2_FS @ 0x18100000
>>
>> I don't know if they are all exposed and functional though
> 
> Hmm, I'm not sure which option is technically more correct.
> 
> I did try swapping the clocks, using daytona as the iface clock and
> `hs1_h` as the core clock. USB still works as expected in Sony Xperia
> SP.

They aren't handled very differently in the driver, one's just enabled
slightly ahead of the other, so I wouldn't expect it to surface any
issues (although perhaps it would be good to know whether downstream
e.g. does ratesetting on any of these clocks to save power when the
full capability of the host isn't necessary)

> If that's what you want, let me know. I'm also curious whether others
> agree with this approach.

Dmitry?

Konrad
