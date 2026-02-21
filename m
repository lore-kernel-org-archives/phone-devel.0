Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51F73126D7
	for <phone-devel@vger.kernel.org>; Sat, 21 Feb 2026 02:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771642181; cv=none; b=pefpzHpkME16L+usXhWkVGhgbzujND22fSlVYnti76t5UbO2LV1i7bXKOqmnx9IxBw9Uswxb0Rb+YA4UaJINXkecmWKgW6sY+YDnz0gQIMOxIFmESlGXqePVdY2rPt4eGmk39Mo3EWNPnSE8G2DhvMCVZps7Gx6FCWRHJhJQX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771642181; c=relaxed/simple;
	bh=uq92ycsM47Jo3q4lAh30+sbvRyqWHRljr1zKiEWutzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brHLQQz5IaifDSU305rZ9IC5YrwQo2rDPlEkVdAoyZ1GaK5F4RhNv/007lcelZy2UaWbqADxZhDbc8fHteGtIxhfBkvqARteSZQOt+8wjfDF7UrfcPoJYcdf76E2UlQvdufa7ydio3t51Epk2B/0edkM7lg7jtE13YlrWRW870M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zbrur7YM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayU4VO+j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zbrur7YM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayU4VO+j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KGWlLc2492207
	for <phone-devel@vger.kernel.org>; Sat, 21 Feb 2026 02:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BmWwSyvtQgL34OEqTM20cBfqvgI2QWHHCJgEeagqLDo=; b=Zbrur7YMuFsAtxgl
	ZpG+MMTRvPm6XqWhMA1Ukb4OavUa/TsVFx9pZXgp54AeaRplZb/PjaiGgnI/GXNR
	bwoRxRbu/ole69KAiIu2IhOCh4Arh14MtlwsjVRXpf7Shb3njsZ+ShajScnzhngH
	ygc2/CNALxCschU2e+xiIxqTNbz/DJ6SPDjJAY7NMe3JHnR9fRMZJlcnEOQ9wN3v
	YO2jhYMu42cqKkav9Iq37LzcOiDVKfFw912380YcxmT6l3JonCqmtvC2f604t96r
	h4hFSNiIX2uiifLhBQY6UG0n6b/46WEGKmfkR1qG5UMdtie1ifuOoJqLh+v+Hbjn
	PC3lWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh4j2yh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Feb 2026 02:49:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso399220285a.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 18:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771642173; x=1772246973; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmWwSyvtQgL34OEqTM20cBfqvgI2QWHHCJgEeagqLDo=;
        b=ayU4VO+jPo2fCWEKsdD9PtYTeUq2N7fQLzeShwIVShqBaVgczSNHed+3A5pfHvvE/8
         +nY9uQnu449ZPczMr41AJL68subWuUreDac7rLp298rosiGC01wJSHaxb7JD/58zuGic
         WoX2RYdly+clzg6FPP8ExhWb6ZSTB5EH0qTXjR34lrFgYCUsCskclzMXKkxe9WGLgzC0
         z3928+1qX0l+qukA1Gs4/SJEdDbKQAXoaIrRPVLf/oJ/OeqQIO8zgq5IE6DWab8pnNw+
         YcpHKVD3DivFV1O0ZTpN28xUezT6V9x/WazUC9fKKCb5gcqKIud0kqswSR/8mE4FkPRm
         f1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771642173; x=1772246973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmWwSyvtQgL34OEqTM20cBfqvgI2QWHHCJgEeagqLDo=;
        b=QVlC5Gvs1fMmPGcYcE8uRKDQbYwTeowz9/C9auoa8RG70xJaaRjp27RdEJPwX5Xaap
         95OLxXb0qpW3vi+e8HoatfsIPkpyHkSf5kSkj6FDDzxa1XucSXIhlywFi6znJxc19Udl
         1ZLmBigfx3+fBzsst/CHTBWAJmxR0hYDKU9SgPF4NWJ0XKL3iJLsv3f2z/PTdxHk/BDU
         P5yzNe3oH7UsTNHx1HlDHCUu/6dXCslZQrMF0K6yf+VJ0xqQc6jKRpKp4mgaZ/cai5bP
         GZ7ttWU9pM69+RISoBoguHwlC6dyWLES+Gw1ZU8XzvUmvWDSHQJLc2xdyqXmE+ivkrIF
         3NtA==
X-Forwarded-Encrypted: i=1; AJvYcCUQrx1vJ7Yy2Nc09hL5HXAzPLyRHZISJY8QC7swfHDRb9nhWuLVV/SmKf2ZWHQb3Z3HO9mBId5UeQBwFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6AgGMIQ/uqw7bFZdOn36QzPDNc+wmWjMnJscF+naRMASp4O4Z
	Tg3y+gHIGDamOdRMdCLxUvaCdm0E6tpQ8//fQBCsXiUjjdumA7ezn54vdpc8aHLxA9VswDKQlTk
	qGK+sWFTCiw/vyJ3U5tIPtsTF0JNWPwB6MD+2ajuUzgHLEiicka9iW2nC0+C/P3Nxng==
X-Gm-Gg: AZuq6aIuDUZK1cNThIOlYuFP5IGUNtVFDLpUSRiHjP8RktO+p1+aUZL3tNXK8qJE1/o
	ek9MjOipamTQJ8xvvWLXtfTPJK0Nb4FVOibH8ULQyLzS1xrQE9qyeWaKFLUlzRWECr4LZ55LWsF
	zsme5nv3qd17jPH7WxVnM6YTdcjm/7kwY+I8G2CVVs6fo4xteKFdgT9JbE0X2QftvKewA3fdf0W
	7HDyA5fluUXzEtFIMuleM9L9/5iwEfnfBp2m6+M3HxirVmxls6uB6/N9dpK5/JTHXW80baXc+WB
	ltKVMkr0q5ZDPpUjdl8vaXck/v9I5JO7fI/uXJVbrnPfI/6JuQ3/WbKHYLRF3BzS4Aajq/Zr2Bn
	IxLRKRNyJuNFO5Sx95qixjEco/TG2Q8cVprD0+kkMLuXHCwQNNitnMuGQIM2OMdrHxLDiXVCIxZ
	inwmldOJ2kYDKktU/WktzY3eD6omb7SfZiEew=
X-Received: by 2002:a05:620a:1a0f:b0:8c6:b45b:9e2d with SMTP id af79cd13be357-8cb8c9fc7a1mr245186685a.26.1771642172448;
        Fri, 20 Feb 2026 18:49:32 -0800 (PST)
X-Received: by 2002:a05:620a:1a0f:b0:8c6:b45b:9e2d with SMTP id af79cd13be357-8cb8c9fc7a1mr245185185a.26.1771642171899;
        Fri, 20 Feb 2026 18:49:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb1be5fsm179895e87.39.2026.02.20.18.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 18:49:31 -0800 (PST)
Date: Sat, 21 Feb 2026 04:49:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hansg@kernel.org>, Jens Reidel <adrian@mainlining.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 battery temperature node
Message-ID: <yikwygc5gasmr3cdyv5emfr2flaoraxcz7ap3j55wn4ib6wfqx@4yxoly5zrucx>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
 <85ce1f2c-f5cf-4e97-9611-4aed03f69cd7@oss.qualcomm.com>
 <DGJQ4WLIML3H.GAO7T4L3MCJM@fairphone.com>
 <a422e087-a91c-4bb2-9d95-e1cefc9a91bf@oss.qualcomm.com>
 <DGJR40B5R6MB.1V4ZK5SW1PXAV@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGJR40B5R6MB.1V4ZK5SW1PXAV@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDAyOCBTYWx0ZWRfX8VfLX8n6gYQi
 SRhRvlSee3Y57wq0ZxEBad4NaQKKd2zO+8BN6FxsClBi6aEjsAXpR2hcYb6E42+xpqMl97XrfuI
 ptIWJHzRZtIZ+hYFbC7VgYqPY77wcA20TiQ5kMOWPtR2F2o4+1K9RAFUGKsGS9mH5WAUg22w+Y4
 eseT54Zlbumo18ADUrRol/BwvoqqOhxCzWCBJ3U8xElR1wpNkbLu1qTC20zytLL9RyRmJyIFSYK
 zb6rToSnalrk6zjt6MDj/r+1LtkWb/zFS2jw1a2n/mqrY8TMIvV8iZYd6OgcbpVrOgoZO06dqYy
 NsqJ+cLt0LdVCaDaqBgX0mzygTB/O7Vb49pZjPnGUBy7fnY+riBaTCAXUzF8lIRgqEFjv6faOwO
 2uUGj/LrtDgp+ioCmjZuWYV3xSlB4p73Htchkfn5cQs31pT8a3xizq+zqgeggl4+rzOCh8Gv9ow
 sz0gM3bnqEqNuMrU0QA==
X-Authority-Analysis: v=2.4 cv=R/0O2NRX c=1 sm=1 tr=0 ts=69991d42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=Wrfmzfmk65d1CdvWbAUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 585WtQ81QQ5CN6SXHcsi4iqoAwF6TzPI
X-Proofpoint-ORIG-GUID: 585WtQ81QQ5CN6SXHcsi4iqoAwF6TzPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602210028

On Fri, Feb 20, 2026 at 12:26:48PM +0100, Luca Weiss wrote:
> On Fri Feb 20, 2026 at 11:51 AM CET, Konrad Dybcio wrote:
> > On 2/20/26 11:40 AM, Luca Weiss wrote:
> >> On Fri Feb 20, 2026 at 11:00 AM CET, Konrad Dybcio wrote:
> >>> On 2/20/26 10:19 AM, Luca Weiss wrote:
> >>>> Add a generic-adc-thermal node to convert the voltage read by the
> >>>> battery temperature ADC into degree Celsius using the provided lookup
> >>>> table.
> >>>>
> >>>> This will later be used as input for the fuel gauge node (QGauge on the
> >>>> PM7250B).
> >>>>
> >>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
> >>>>  1 file changed, 83 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> >>>> index b697051a0aaa..7857003099a6 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> >>>> @@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
> >>>>  		io-channel-names = "sensor-channel";
> >>>>  	};
> >>>>  
> >>>> +	bat_therm_sensor: thermal-sensor-bat-therm {
> >>>
> >>> nit: this should be a little higher
> >> 
> >> meh, it's surprisingly easy to miss this sorting stuff. Will fix in v3.
> >> 
> >>>
> >>>> +		compatible = "generic-adc-thermal";
> >>>> +		#thermal-sensor-cells = <0>;
> >>>> +		#io-channel-cells = <0>;
> >>>> +		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
> >>>> +		io-channel-names = "sensor-channel";
> >>>> +		/*
> >>>> +		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
> >>>> +		 * 1.875V reference and 30kΩ pull-up.
> >>>> +		 */
> >>>
> >>> I think this looks good. Is this data going to be correct for all/most
> >>> devices (i.e. is there a single battery sku)?
> >> 
> >> Yes, from my info there's just a single battery SKU, so that makes it
> >> easy here.
> >> 
> >> For Fairphone 3 there's two battery SKUs:
> >> 
> >> * (Fuji) F3AC with NTC 100kOhm B=4100, ID resistor 10kOhm
> >> * (Kayo) F3AC1 with NTC 100kOhm B=4050, ID resistor 49.9kOhm
> >> 
> >> In reality, one can probably ignore the difference between the LUT for
> >> either B value since it only differs by a marginal amount, but
> >> conceptually I'm not sure how this should really be resolved.
> >> 
> >> We could have both battery definitions in the dtb, and then the charging
> >> driver could determine the battery that's actually present in the
> >> system (based on the BATT_ID measurement), but given the design here
> >> now, I'm not sure how this temperature lookup table would be propagated
> >> to the rest of the system...
> >
> > The path of least resistance (pun intended) would probably be to make
> > generic-adc-thermal consume an ID channel and accept a number of LUTs..
> 
> Not the worst idea ;)
> 
> >
> > That sounds sensible since most battery ID mechanisms are probably also
> > ADC-based and one would hope (tm) that the values output by these ADC channels
> > would then be distinct enough for the driver to have an easy time confidently
> > selecting one of the options (or a fallback)
> 
> Charger / fuel guage and everything else battery-related would also need
> to get the correct battery properties for the actual one present, not
> just this generic-adc-thermal driver.
> 
> But I feel like soon DT maintainers will say that Linux shouldn't
> dynamically detect hardware that's present and the DT should be the
> absolute source of truth. That works fine in simple cases, but in case
> of interchangeable batteries, display panels, camera sensors, this won't
> work. *Something* needs to determine what's actually there.

How is it handled for the Android boots? I assume there are (at least)
two DTBOs and the correct one is being selected somehow (via the msm-id
/ board-id?). Or does ABL pass some kind of battery identifier to the
kernel?

> 
> And for most of the ways to detect which of those are present in the
> device that is booting, you need half a kernel to power up the various
> hardware and do some basic communication to figure out what's there. Of
> course you could say that's U-Boot's job for example but not sure you
> want to add a CCI (I2C), ADC driver and much more...

-- 
With best wishes
Dmitry
