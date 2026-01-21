Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49EF2BDC2C
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996233; cv=none; b=YTuahMMVu4xCfVAxnGHH7U+G47ehtEPB1nDaqzjyrHBQLSGKtp2UoFzz5skPVDigW3Nu2hvBszKvzzt8lU59Gsb0N50KWtLTtu0Uw6dXo1c96l5UCJT3UrmVGfETrIQzt4IvLbU6aYuvdz1MmN4Za38wl3HBCncZSohzA0abkJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996233; c=relaxed/simple;
	bh=AcnHz+YEbhMZrb3eF/ZHw5vnaNb//oOZmIqA6ylkY6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFi3IYWb6G3I2bHR9Agn+upbheI05641vGmFRy8KECBmYjudmOkVflL2AX8Jm2jEHztnCA2bznu236imIoNqRxgeKZcP+OvSpe6FRy4v0St/GKBqk0e6emZ8DfbpRhr2dVwiWZmenftagyYlxm2sTLWG4y+ylLsBsLJmtM4ovaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADq7dq0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUEu7RYd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADq7dq0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUEu7RYd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9iV6B3481440
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 11:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SLqEIDpNRShWPG3vGqyKlNb2m6iu5UFw+srphCD9wI=; b=ADq7dq0IvmYe+BBT
	UQcf0p0oGL+9p7LanlFYl3TYDxQ/4Ory4teYl4NaYokaJgDkosOEJsksTwf8zgJ3
	np4RrWNnyzlbx+ne48hr2rQB+gbYc1UyBYvfZ/R6dOcDoOJPNLQvXWBit9/JqtaS
	swBF+ItdPeNs5QLfpx5FEm2fVjYlOhbKz/wszXngjplMVpTN5pKgUEx095OLKJVa
	oWGdp0yfzn6F0XgITH14hUrZQZfHXzjpfy4hSpYEyJZNKM+3Yn4fjx/a+m4/Pr++
	ukD53h95q8ETZ/CcbYSMInhQk3Azbi1pBMNewnxlaenavpM0YnC5fgocMT3GUmw1
	3QkkSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef0g2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 11:50:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5265d479dso219468585a.2
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 03:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768996225; x=1769601025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9SLqEIDpNRShWPG3vGqyKlNb2m6iu5UFw+srphCD9wI=;
        b=BUEu7RYd1FsN3DCCkpqUZva7kjsskDrHu+qVqZ0crQQvhgj/pchnerDec/8/gyTOn8
         kWY/p/7I3qixPPXq1HV+0d3U+LCi/wLDttiwy11JDllhFPAhmKaiwW+kfuNM81VtxxCw
         FF8JuEf7fMvjHQPFrFt4uPYzQpU/L4LhZEVOrQhoNQDbOJGRklKGkOWptCWieSdYL/RL
         4/E9XCHAd/rv/3rzz718vUxg46Rqyu1UHgN6mjRtP5eDO7D6BuDI8flBRX1kxEGm2oRC
         TUn75p+e+0cqY1x0bJ8i7QG0ollcPJqzXHoHlysawsfF0990X13MrAFshb9TRs4oy40l
         6CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768996225; x=1769601025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SLqEIDpNRShWPG3vGqyKlNb2m6iu5UFw+srphCD9wI=;
        b=Xvm29M0T64aitET+EztuHD2DMtQqXqwmQ5Aev1M1kHJi8kdtl29sby9K2AxDYh97gi
         HAf1Bc51NRTID1y6ROnJqlBLaoL/VvDViO9IH8c7AVPCRepIn+ncATPMTVwlyVfBoDBC
         GgEXpf1z9QXrpJmhM/A80XrcDN03MxeFVkbVbAwllYXcfZ4msjU+hbVGw5JtvzRFP+Ei
         pYO0vn0VguSwGfre/R7cKpKC2l+K/eY1K6ZYgL+q1ZJE9F4UfHj8/O2+yvj23vOzLJfR
         CYv+6Qle5QRFDC2CJMC6kSEIPewTV2d3Bz08Ua+O7qZl5w++KlTG0zM1hR1k4C8d/m/S
         s6XA==
X-Forwarded-Encrypted: i=1; AJvYcCXr5nP4s/ER38rEwbRys+UpOM0XGYnyVQX2S/pwwfm/ggZcpJHPrNgXWvo7oZPBWqvfGANTPgqnGGwKYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo6YVogl2SGbu/JBpleYHkQu3lDCCpISig2RRGpuxcNlY3GldD
	Kqh65ULSnVieCh/Ah6Zh6uC57ejQ/x36xhyGkvMFtNEDzzBT7kZwN/nzxd1ZHTS8XSEWc6puRF3
	78wzBxTI4X1QuUrpHERySueuLLJ3qXW3EHuUdbOFWxVjI1JVOsVQhLL++KeL4VuFGjljkawOMtw
	==
X-Gm-Gg: AZuq6aIM7sCXRsF9pDvxUgd5URiQOlR5Kdbke+VJsloAaYpcpllku2R6Cz8vMwHqKRN
	eI1Jm+BkWpJOaQTNoB/6gLyFgLalzpy7o6xzP3kMevnTtvO24ZVJnzm7ztw9Vb9Yh9XMrre820d
	I+r3k/XmlE/QN9hx7PVQTKFqov0B2s5g7aBHsdKiltcDtY1Cp+pBWnq+wBYgH1nlwmkBXzTsMCH
	avjZk7kZ0YOu6/I81ptToFrDcGUF2PsxRXr2Hgiq531s/fnPtK0MqWWWRGbO+2ajhehB5Rqhjpw
	J2KVINeoUjepj+o1t50TtAI0bR1jky+qTIw3SdQEzs4mFaDQkfvMLHVKryPTNw9PTBHKyr9NqDe
	x14YdqAX+mXK/p33rvpPXMKkzrYN44Yarf6D1S8JNICN8R9OHUjy2tG1siww2A0T+BHY=
X-Received: by 2002:a05:620a:e05:b0:8c6:af70:22bb with SMTP id af79cd13be357-8c6af702446mr1263291085a.5.1768996224929;
        Wed, 21 Jan 2026 03:50:24 -0800 (PST)
X-Received: by 2002:a05:620a:e05:b0:8c6:af70:22bb with SMTP id af79cd13be357-8c6af702446mr1263289485a.5.1768996224486;
        Wed, 21 Jan 2026 03:50:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168e6asm1648458066b.22.2026.01.21.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:50:23 -0800 (PST)
Message-ID: <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:50:21 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vZC4T0I-Rbse0KSV1u7vcNamTJJ5Xvs-
X-Proofpoint-ORIG-GUID: vZC4T0I-Rbse0KSV1u7vcNamTJJ5Xvs-
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=6970bd81 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8
 a=Ae2tQB4DPc1jRJoPbowA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5OSBTYWx0ZWRfX6lha8cmAD4/N
 MBDsOXv7C6hJpYwhRMQFIgBRYWHJZCfVsmkSoukDgY/9HrnhqwEwAU8U9oBzA7X4XDOP/w0GIim
 k/3BgejitefrEn97CAbHqs6shpf3BwqjnPV1xqB1j4UN05GF3SY9s3yFecwPMCqk29oNR7Aq3aK
 MirUEDul26zZo3AQwg3OaD5FexyeKNBWeOtpkEMckXkLNZpEHTKaQ3Ku8lu510gGn0uDTJqRJ4x
 Htz8YYR6kBSfnpp8839o7xQSXU99MGP9IcJvY+TcsF5tepuSeadThaJnto9VFaaMYEQDQMUzqJS
 j8boag/FobPIrOtgr17HiiZRDyZuezZ1bDxDymUDsSCeff3/nnCpCXjZ1LmYUuviBPNrULEpjZa
 W40bh6mgZGEX18NTzhhGkToXn6F66IMtbpjvanVgGajFsYDv9KyB9qvXRzohvCuaDj0BzZCnip0
 YvZLla1zCdckq02Lrdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210099

On 1/16/26 3:50 PM, Luca Weiss wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> the missing pinctrl to make the WPSS stop crashing.
> 
> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index cbe1507b0aaa..75f2b3a3e572 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -232,7 +232,7 @@ wcn6750-pmu {
>  
>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>  
> -		pinctrl-0 = <&bluetooth_enable_default>;
> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>  };
>  
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
> +		pins = "gpio5";

I'm thinking how to best reflect that. Perhaps gpio-gate-clock which
would be consumed by the PMU?

FWIW PMK8550 can reportedly output this clock from GPIO3 and GPIO5
(not sure if at once) if set to FUNC1

Konrad
