Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28392D8DDD
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029629; cv=none; b=Q7LChLX2hIXJuWVjt6g9uV+S3/npmQphfvxgvVFV0jj7Ku3kqoGh/nfDZyj/sS/0+iztLm3RhpTLrM+d4UpRvKoTvTY+Y4WLuWD97d9Wo7i9imp+KYPtBLxNE0psq7uiwSSCHI61Ze9OiY9jfI3ljhe6YDCHQfZntMsMZO5M5nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029629; c=relaxed/simple;
	bh=tg6R/OxBEXFdnuXFE43TcWTsroZknzNNCoZ8QfLjMNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQQxXfapOKL0VidwLHJoY4gDGvIT77phnwufIwnHjRDhUp3NC3GwBpNCnDyqtlCcfVnSjLhlvYgONOjDIXG24H/TX2lmMt4WukNqFnmDZ8+FqVvhKR1rFbZ7Grh785/gcjNeepCVJE93Bg6wIcbbCPn/M3NFikFd/06kenO1w48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JywYaVQH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JywYaVQH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCNvWr017812
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 13:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kOUX/LASzquhlb9ZqFy8fIjM
	n0teZEO5MHWRCaUTrxQ=; b=JywYaVQH2xpBA+Ok0aU1EP0ExUHBMUZBKgrR3LNf
	SQksZCScvWtjwOB/RR++LZkdiDz1NT+jBCqKdL/rnBqfw9D/RBXypRTnT7kCU/3i
	9/dbWTlK0kxpykswfFZy+sOsVMuY87euqbHCE1IlA0Ae0oXv62bkyMwlvn/n5bRw
	ZZawutGCgLdklBlY7Y8QHffk4AiAXqMIKOWbeZJW9w1OCl6T2DZAmyJncDOfxpmT
	sYJwQbu3asBc0dYc8ZZHEwdVtpcbluNzgfL62KYHiA4hcjbC+gnp5G4g+XNwJUsV
	uG0XIQgN0a1TxTVoQ5QhMHpmS8OtxjFubNJBZRoyXec3Tg==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx57wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 13:07:06 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3df2e89fc8aso17632565ab.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 06:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029626; x=1751634426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOUX/LASzquhlb9ZqFy8fIjMn0teZEO5MHWRCaUTrxQ=;
        b=IVQBsDgJL40AlGtb7Vdy6KuzhM2awO6ShA9q8eyhYQuUCu+2Bow1zjqKc/nLoKr4MX
         a067ZBS0NrNs2PCLDeBaK5+Mk29kgnR6yUOk3ZAFUOiDDO0gEwHWI4l0qp3ev1/k5QeM
         iVlOImuONN7Z13+jTPPAS+BzrnprSl4Ksg3a9aqKDO1nPpFwOsgpLebzRV0DGcZde0SL
         85H3975dGKFInqDYMxcNGbB1tx06gG2N+6Fj9zdLlhAq0rUa+uhJeyyqGaxa2C+a1wvw
         KVGHx0ZEJDQKx4VkDENEeyaFWjU7BSCCul+sm7xOdcg4VznojIjarOTgaewkMxbGEHZY
         sqSw==
X-Forwarded-Encrypted: i=1; AJvYcCVg3eUUzBpthTTSejEoHTESQJPCPUi7ZLEF2G2i8TunkXLM1UjpXbLUrfipXHGupd/CIdjmg4vrHG0uaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6cE+7380YXIo38FfJwmxZVFLPPkWHukwdwqh/SAPDD6/T+Y5
	h7MuqaTJUW5C81CZZfLKhOGbg6ePjQzAC7iuUYKT8HDfisI5TwjhuJwwpsYDUXrqCy5TURyyP0o
	IkIm3A5K+d5SFKQpCLirNfYK16c1ibI1Sguwnu/Sd1DhvJRaKoxynjDyi3l0FJEfcaw==
X-Gm-Gg: ASbGncvy/sdBB4TjhrF1lIVS9N6XYl7bXHoRNpcbIY+5wlIkPpR2HJsTbNLoTbwKIeV
	NSan9mOaFLApR4+8z68ASv8+lqtWa86QamNfEKPodJfMmjXtVx+KRbmsJvcNwbqlk2IOrv8PnZe
	bqzdCvtor0ifjsMsLUIbPET42wABzCW9sCDLS5wtk41p39L+nLIeuM1XPt9kL24yZQ3MZ/SUxX9
	cewcCoTORCwVa0UkrUa3b7SxnWIBtDXWbPdj/9PlWrHbB3h+KtF7LKuUtywICLbwG6NLFvf+EXN
	ZKoimWQU4N4mbbp4EXZSth5o7+GghT6X5sc3pia7M/FmjTuwQXVLIUk7s4kbfZQVwSE6yWaVYN4
	SLa36yNMA3/JVOLRoOphVN61whUHZujOEcMY=
X-Received: by 2002:a05:6e02:1561:b0:3df:34b4:1db8 with SMTP id e9e14a558f8ab-3df4ab3d2a9mr43206155ab.4.1751029625705;
        Fri, 27 Jun 2025 06:07:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE50hw8i/Szi+Vi9+TVEvYSP86FNNUfbWZEopTrfXXcxIjLifGRpkjO0fFOCbyvyj5vIC3A0w==
X-Received: by 2002:a05:6e02:1561:b0:3df:34b4:1db8 with SMTP id e9e14a558f8ab-3df4ab3d2a9mr43205145ab.4.1751029624832;
        Fri, 27 Jun 2025 06:07:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403edsm451530e87.14.2025.06.27.06.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:07:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:07:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <lrbqjf5zxxyjnyfwwk6wniauffi5a3hgkg7jvboybvmrwxyu52@56onam4vvhz4>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
 <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
 <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAX8BTNMDC8Z.182KEGJF2XRDF@fairphone.com>
X-Proofpoint-GUID: 6Km1uOkHetf3t4RjqS40ssIVRkaLRbYT
X-Proofpoint-ORIG-GUID: 6Km1uOkHetf3t4RjqS40ssIVRkaLRbYT
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e977a cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=62jDj0fiULz5QxSi0P8A:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX0OEZKWLhrY3s
 YiJSueDrgbU0AFzyVmZN3X2fCJw38Hgmd6XbYw2Vq3govI+S/qPe4BuIn/xVhkGyhT1FKxvqcZ+
 UxKsNcBg+dgnkI/hZ7o5hceD6dPs/LRY4aFjCCAW4dBtRuR6CtNZmn8IZcdR+Q1pSwk88qqXvXl
 hf1Gpion4i8Ma0g84iqtLw7xSItw+Nmny6yD4a5VQ/Zuj79bLWAkVp5dU0Ssqsm9wNXNo0BJHCA
 bLl3vbRdSJqqXQkhnKzA9hdj3r9hxczWhltWbL/d9/Z4K0r4b/YrRqQP6NZAZ+7qF190EMDfq3Y
 eTXeYQxfn+OFpgK8jMmOAWYCBBeIebpaxXsymzdoHCNHjHEneDD4DlCQPhyUaj7CYLZHCus0KOx
 z+zzqm9nrECPTORiJoQ0FUCaSsj3rH3FlaRpTIYijJRoL2XdPHM15LMtvLnTqot7a+w84qPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270108

On Fri, Jun 27, 2025 at 12:05:08PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 11:03 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
> >> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> >> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> >> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> >> >> and the devicetree description for it.
> >> >
> >> >
> >> > Please use PM7550 instead.
> >> 
> >> I'm happy to not follow downstream naming conventions if being told, but
> >> do you have any details whether PMXR2230 == PM7550, or PM7550 is just
> >> another SW-compatible PMIC as PMXR2230.
> >
> > It is PM7550.
> 
> Ok, will update in v2.
> 
> >
> >> 
> >> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
> >> get updated for the PM7550 name.
> >
> > No, leave it be. We should not change existing compats for no reason.
> 
> The compatible is not used in upstream dts though, and cleaning up some
> old naming for the PMIC would be good, no?

Then, I'd say, just use pm7550 everywhere, making the qcom,pmxr2230-gpio
a one-off unused entry, which we might drop at some point.

> 
> But I can leave it for now, and we can potentially take care of it
> later.
> 
> Regards
> Luca
> 
> >
> >> 
> >> Regards
> >> Luca
> >> 
> >> >
> >> >> 
> >> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> >> ---
> >> >> Luca Weiss (3):
> >> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
> >> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
> >> >>       arm64: dts: qcom: Add PMXR2230 PMIC
> >> >> 
> >> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
> >> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
> >> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
> >> >>  3 files changed, 65 insertions(+)
> >> >> ---
> >> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> >> >> 
> >> >> Best regards,
> >> >> -- 
> >> >> Luca Weiss <luca.weiss@fairphone.com>
> >> >> 
> >> 
> 

-- 
With best wishes
Dmitry
