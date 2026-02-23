Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC836A010
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873513; cv=none; b=fkvrsNcZvrxvH/CXnsWvgK9TSODPOTNiNOt58MrWdqmvljrZCBBPyH3BRG9RsQsPxh8Va1rKjFyAAXmmKv2KlxhyQQY7zifTqPBUP93ZB8PIfUS07JPZLif6492AidL/7815arYMPhveJzgZAhxPDFpi8riZzK/lonnvh/ZkOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873513; c=relaxed/simple;
	bh=+c1bZBQs/guNz7fjEph0UAOI1LMhure7eyCMtUj6mL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5+o0jd1BTwbd+Iz5ao/f7F/AnAzjrhFkVZw9JjQD42T8J/IqndTxS3QJo5nNcDaGE8bclLcUIApQIJk7ZS4YPZrKVyC/xaAQgGxDnZGdqSE/77Ai8jgNf6OtPUgl2mlGFktNyj5RSzmgJupknqfNQBtRJ6Dt3J77sLXijK5fo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuqL9frT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNH3VALr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuqL9frT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNH3VALr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH4lwO910846
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 19:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzRDmU+V1N4Y2c/BrLaePKh3e2DWyeiVEC2s5+FnDg0=; b=IuqL9frT3eYrhIIB
	NuxvfBGQwC26oEc6lOpSKdaTr3dKtYr9sLzCX+vvkDYAu28/klWz5qjEI8bztiSK
	l3rDltBto6ORydt1gp38//DIVORhGYpBDWPm9+8CXU9r3GLw6jDSLLGQVtFD0qHa
	yIzhV8TchJGZW4YIMFEMgGDh80hv9H/x8jw4UuTGuWJ4SM6clqRNT26VyH+vJ8fV
	SJQOT8kv3K1vKqi0h3JR7KDxVrcEMNIZkQTPfUGxaOUSkpfY/Exi2dJ8ZDDAD/N1
	anHlcbk2wVz3+1tDU0yct5fW8mrLlxziJiFhO8SENs4EhfD/Kf4o5PFMbQ1CSxZe
	dM16ZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj8cmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 19:05:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so4070067485a.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 11:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873507; x=1772478307; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZzRDmU+V1N4Y2c/BrLaePKh3e2DWyeiVEC2s5+FnDg0=;
        b=GNH3VALrJrhrVRHyfEFG6+M2vg2JhkSDXb4J1CzKsnOkrymwUzpx2feX7dlOEu4TcT
         B5sBQ9yPcNmVEwmFMTMn+FSTq9jm/HMItsewTTFX400/mphde//tM5VgXf78ZrISR6fZ
         qVmVNxzQvgBLUtiZW23cI8X0ntyVr1i69Gr58A5FQL+exq9BvvZWWUTyrLT604ma7/sJ
         NUnwBa0jBgtk5gK4b/VnR6XDc7lYsVgBzLpXDPOKvGSGYfmxJroFEHu4wxa4+BDUHI8j
         zUuJ5kmhlKESBoxLPi3CuYU9li07PEyWwJfzxre+Qst+h0p/0xrKhs6gqvdW8cKXi6zP
         Ghdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873508; x=1772478308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzRDmU+V1N4Y2c/BrLaePKh3e2DWyeiVEC2s5+FnDg0=;
        b=eiU7ANeKS5s6HEWLm5BXUZAtPiNb4DiLB15D5mrm6YD8hqhWv0C+btbiBkFteK3cqV
         O8Ev6mPj1RhKe9DtlofmQjc5u0VDolOkO/hkLardnNzlu3hJDdqLgQ6sMh2Oghb5e617
         DE7UHZzHC/EelD79ydExhDxLxaf04CnkJXUSoOeKoVFT+XqjyZF07IzeyZy9drKT5iow
         aXciKPg77F3rarwAgX2ea8I6QyuL+dEEtWHm/q5vlywKuo8J2WXbM9RdPriS9TK42w16
         RLgL+fjOSEGIMKwLvP61qDIvVuwgByIQP6qUSd/MDntmHc6R4eUnULD7n1qdWoPOvZLk
         qVFw==
X-Forwarded-Encrypted: i=1; AJvYcCWTNebyAB9dJt8hT3HgUaImpuZXiflDzI//2ZUueaHK3HfudUL+q2sz/b+O1VxAgrUW6QIcmr+81wK4fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze544EvvaVs/sFUQMvOSHrrnpkDrCxuudcWyAjsbcbQZag994K
	Lm/jlRykCxfymW1GoMm627bb7ToRNe26TeninKUbnCA//mu+p65I6Q2WHhXICuvkIq0+VPFdCsq
	+MGIBhJ+tBFD0EaFPGoc1gWSSvFORHdV1Q10RggTD+mLIjTEvWafnpl6TTMscHYvC6w==
X-Gm-Gg: AZuq6aK4+zBZ+x6eJ9HJRyufFiycn6oW4U8kk/I9KErcQPKUE+MUsheJi+KPQEGzt4N
	TALT5PAAOwJvCtRJTxgMM6xlT+Y2r0t6UMvzMZZa/wBdEGxfUuRA+2olKamV2/gdCgn2TIj6mc5
	rJX94mztpAMXp0wwQtRhzROxRTT5/xdFKWSZKAlfxExZPsq6jxX7lhOSVC6LwAZ8A1jqizx2ypi
	cXVaUDhU2kreCOqcqAo2RuQmkVxayzeeTlfPXbYmShxXCV120ZLRMD6IRRNLKsXOiRWTQT+Byzr
	qZIyGORQ3Ice+bYazRcMxflEPQDzWiEUBn+Ofeajs+bituTiTUg44zC9g9FlPbe+S9wP+OenPNi
	yc0zpvTk5EOPh4hjT+2UBFvd6+6e1lv/7BQ1IzWtGinkmzn9ij5gxHbqhlrFb4BkDGI8EUkWXGY
	HN8vMliqkh5dSt///2Piic98Ti2xaFae4FVe4=
X-Received: by 2002:a05:620a:1aa9:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8cb8c9e6647mr1251513485a.12.1771873507011;
        Mon, 23 Feb 2026 11:05:07 -0800 (PST)
X-Received: by 2002:a05:620a:1aa9:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8cb8c9e6647mr1251505785a.12.1771873506405;
        Mon, 23 Feb 2026 11:05:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a207a1sm16902281fa.21.2026.02.23.11.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:05:05 -0800 (PST)
Date: Mon, 23 Feb 2026 21:05:03 +0200
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
Message-ID: <uivc6k5luetg6dfih5bmkkywdtxkg3jxk7zpem53jwcaetfb7l@i7v37nvm2tku>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
 <85ce1f2c-f5cf-4e97-9611-4aed03f69cd7@oss.qualcomm.com>
 <DGJQ4WLIML3H.GAO7T4L3MCJM@fairphone.com>
 <a422e087-a91c-4bb2-9d95-e1cefc9a91bf@oss.qualcomm.com>
 <DGJR40B5R6MB.1V4ZK5SW1PXAV@fairphone.com>
 <yikwygc5gasmr3cdyv5emfr2flaoraxcz7ap3j55wn4ib6wfqx@4yxoly5zrucx>
 <DGM6EAN8EJU0.2JLEY3CA0R5G9@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGM6EAN8EJU0.2JLEY3CA0R5G9@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699ca4e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=6H0WHjuAAAAA:8
 a=gvbEHs2N2TqGYGsSA-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xz8DcIF1-mueQrCMPl5E1U0TcnyNbepO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NSBTYWx0ZWRfX/pAZZFP0s5dT
 GbUQh+l2IagEaV/KPR5uUF4Phj3dYJOBomi0fb8Hh8IJg8Qvwvte06kAGnS3mozuXbCZuQRGSjy
 gBg1LtzPe6u9gy0uNb6gB19BH2Nc7WVe7LH6xqS/iGsuTTBbbqLFqSqmT/HTwf6AI9JfGxuKcKU
 H/qtIvCAaQDjLLccRzA0651b5cNydYiyxiF8nbG76aF9zOE7acP4YYfIu48EcuOTu5hwmK19uPh
 saQY5t1OoBZ+IEt4iK9jjCd7d/YsQzdWGDU3JEREs4ZKr5S0Uvfc+/NOW7MmzQv2XiEeOcxhm9s
 DuMuIschWXb3ba/G7ArHlRinkt9AJ4izDhHCsPlxnW0rsCYayFo0M67Usvzi4stO8J8hB+of9TU
 OyPOVHsiTh4vxWQ+sKTwrHr+a3aIeKqN43nWEKwwOWF2Qz4Puq1zPZ2QpY/MIe8zzA5ozilSQqb
 TNy6ra3GzZvzp2HwlSg==
X-Proofpoint-GUID: xz8DcIF1-mueQrCMPl5E1U0TcnyNbepO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230165

On Mon, Feb 23, 2026 at 08:50:50AM +0100, Luca Weiss wrote:
> On Sat Feb 21, 2026 at 3:49 AM CET, Dmitry Baryshkov wrote:
> > On Fri, Feb 20, 2026 at 12:26:48PM +0100, Luca Weiss wrote:
> >> On Fri Feb 20, 2026 at 11:51 AM CET, Konrad Dybcio wrote:
> >> > On 2/20/26 11:40 AM, Luca Weiss wrote:
> >> >> On Fri Feb 20, 2026 at 11:00 AM CET, Konrad Dybcio wrote:
> >> >>> On 2/20/26 10:19 AM, Luca Weiss wrote:
> >> >>>> Add a generic-adc-thermal node to convert the voltage read by the
> >> >>>> battery temperature ADC into degree Celsius using the provided lookup
> >> >>>> table.
> >> >>>>
> >> >>>> This will later be used as input for the fuel gauge node (QGauge on the
> >> >>>> PM7250B).
> >> >>>>
> >> >>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> >>>> ---
> >> >>>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
> >> >>>>  1 file changed, 83 insertions(+)
> >> >>>>
> >> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> >> >>>> index b697051a0aaa..7857003099a6 100644
> >> >>>> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> >> >>>> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> >> >>>> @@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
> >> >>>>  		io-channel-names = "sensor-channel";
> >> >>>>  	};
> >> >>>>  
> >> >>>> +	bat_therm_sensor: thermal-sensor-bat-therm {
> >> >>>
> >> >>> nit: this should be a little higher
> >> >> 
> >> >> meh, it's surprisingly easy to miss this sorting stuff. Will fix in v3.
> >> >> 
> >> >>>
> >> >>>> +		compatible = "generic-adc-thermal";
> >> >>>> +		#thermal-sensor-cells = <0>;
> >> >>>> +		#io-channel-cells = <0>;
> >> >>>> +		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
> >> >>>> +		io-channel-names = "sensor-channel";
> >> >>>> +		/*
> >> >>>> +		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
> >> >>>> +		 * 1.875V reference and 30kΩ pull-up.
> >> >>>> +		 */
> >> >>>
> >> >>> I think this looks good. Is this data going to be correct for all/most
> >> >>> devices (i.e. is there a single battery sku)?
> >> >> 
> >> >> Yes, from my info there's just a single battery SKU, so that makes it
> >> >> easy here.
> >> >> 
> >> >> For Fairphone 3 there's two battery SKUs:
> >> >> 
> >> >> * (Fuji) F3AC with NTC 100kOhm B=4100, ID resistor 10kOhm
> >> >> * (Kayo) F3AC1 with NTC 100kOhm B=4050, ID resistor 49.9kOhm
> >> >> 
> >> >> In reality, one can probably ignore the difference between the LUT for
> >> >> either B value since it only differs by a marginal amount, but
> >> >> conceptually I'm not sure how this should really be resolved.
> >> >> 
> >> >> We could have both battery definitions in the dtb, and then the charging
> >> >> driver could determine the battery that's actually present in the
> >> >> system (based on the BATT_ID measurement), but given the design here
> >> >> now, I'm not sure how this temperature lookup table would be propagated
> >> >> to the rest of the system...
> >> >
> >> > The path of least resistance (pun intended) would probably be to make
> >> > generic-adc-thermal consume an ID channel and accept a number of LUTs..
> >> 
> >> Not the worst idea ;)
> >> 
> >> >
> >> > That sounds sensible since most battery ID mechanisms are probably also
> >> > ADC-based and one would hope (tm) that the values output by these ADC channels
> >> > would then be distinct enough for the driver to have an easy time confidently
> >> > selecting one of the options (or a fallback)
> >> 
> >> Charger / fuel guage and everything else battery-related would also need
> >> to get the correct battery properties for the actual one present, not
> >> just this generic-adc-thermal driver.
> >> 
> >> But I feel like soon DT maintainers will say that Linux shouldn't
> >> dynamically detect hardware that's present and the DT should be the
> >> absolute source of truth. That works fine in simple cases, but in case
> >> of interchangeable batteries, display panels, camera sensors, this won't
> >> work. *Something* needs to determine what's actually there.
> >
> > How is it handled for the Android boots? I assume there are (at least)
> > two DTBOs and the correct one is being selected somehow (via the msm-id
> > / board-id?). Or does ABL pass some kind of battery identifier to the
> > kernel?
> 
> On downstream the Linux driver will do the selection, there you have two
> batterydata nodes in the dtb with each their qcom,batt-id-kohm property
> and the driver will choose the correct one at runtime.
> 
> Similar with multiple display panels, but I think there usually the
> 'detection' happens via what's passed on cmdline from the bootloader.
> But not with two dtbs, the driver is selecting the correct panel from
> one dtb.

I remembered that all panels are a part of a single DTB, I didn't
remember about the batteries. If there is a bootparam, in theory we can
use it to identify the battery. Or we can find how it is being
identified in the first place and use the same logic in the kernel /
userspace.

> 
> For cameras, the camera stack is 95% in user space, so it's not quite
> comparable but also there usually I think there it's trying probe camera
> #1, if it fails try probing camera #2.
> 
> Regards
> Luca
> 
> >
> >> 
> >> And for most of the ways to detect which of those are present in the
> >> device that is booting, you need half a kernel to power up the various
> >> hardware and do some basic communication to figure out what's there. Of
> >> course you could say that's U-Boot's job for example but not sure you
> >> want to add a CCI (I2C), ADC driver and much more...
> 

-- 
With best wishes
Dmitry
