Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87361269AFB
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528514; cv=none; b=EH+nvGX3rBxlOc7PNY9ip1qsf+aeofnFwHX6fQ+yV9TIkaob5Tznrb1HQxf6QwDQYDGBkrYs08q4wBcFlU7hsCqMDVQWDe+h2v4zaTrZcCNpphZKVMUF2CcmilKFsRxKjepjQ/UQdOeilV//3z1Fa+M2sQ4kIMeCkOP8qIq0+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528514; c=relaxed/simple;
	bh=41HHN/qGzJJn4ee86gwGXwwgMCmixPoE3qhczvV5OcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAq5y6XZKgQbA263SaF4B3CqwyMshpChGWXGQymE4RmEJf3x6Wn/jd4a1WnSBXTdx8YwsIZRAJHcBpHoTcyOZfvQtgNogANEr5W0+Sj4SJq0je9ZsyeIwoYzpM88KM2SPckt7tjOCqI45v7TtQM2LFpB5ZiXDxcGla5pP6G7t7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmPOTqhg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmPOTqhg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CHDIE016200
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WT3uPbcX9tBagOLqEVPeVmh7
	jBTPX0krG007D+krSn0=; b=hmPOTqhgNWa1dQLixXBrMJILuKpvcp7ChcpkHbbO
	ISbhAX7J/r6jqhWz4oQGepJ6GMcm5PswwKehMzGNczgqjWxohucSfWEGNKcTlNA+
	mkW67QOcSMotqhMhUnhsMbdHXm566u0kiBLr0XtDJXh+EAHI/JK/vzJ6KOn7oiRo
	PPCsDFnFE1tlQXjnUoDPxOq86i3ZhX0O5ZwsLCwm2G2Kd2tdQgqIsFWii6wIDkVB
	1I9AUoUvHpmL0PHUGK7Eb5Jw8MtXFi0jl4E8bg9JZo0NKeR/dCcmf2kGN/TSbqvR
	csHFRPg2ZfmbOkf+OtfN5RSiK2vn5/LrKO6AD437xd+nLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jeb7hap1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:55:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de5fe839aeso69001431cf.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528511; x=1760133311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT3uPbcX9tBagOLqEVPeVmh7jBTPX0krG007D+krSn0=;
        b=mAEV7LYagFZVw/J8SX+kjRiXn7LBQhnIjgAlEAlA2n5qu3sI51aj5r0nVOjZsqSHNE
         4GuReZpgx9hGY1jG66Sc196TVGECryq+1l0RrD/GehqobTk4Ihqt2udmScIIz37zyTkv
         iz0G793QslaxxKlmhmuIw61HLKHB61zT3CeDS8T+CcAS80VgjD0Gt+xxeXtcrVEgeyOU
         eFRkCwSYkEt4HAg5LQlsqZ4kAE+RNFj3WE2je8omi9GG/Ek6Bc8HHD8I+PxbGEnZGwn3
         /KSgoJw5pAAcozPqZnFvXBYjFRnkA6ZHdut+Knc6GjsRm9MLp8tr4G1yp221xrlSO+gX
         iYtw==
X-Forwarded-Encrypted: i=1; AJvYcCVeN0/vjA3JeqH38scQiIHwdH/T+eX2438I6pKOS0jsAuYdwODcI5bZw0LIt1LQtViVyqdvO8EPmwZm2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNVXJ1HN8oEMCJckLGgb1/KWhnxHt9yz2OFaC8eno7izP1G1j
	BQbtIrEKZeBe6HJ5g6UDXKzDpUh3LXhqUPPT9su5IbHHbrIX+EN995/bb30YcLX86E4KdcijklW
	ubzVnvdibTNk46pdGp33UhbqdMIT+V5XHBpTGMdatY9sT8SioQ8AoTpUuMtZJNTaQMw==
X-Gm-Gg: ASbGncsrn25AMH1+I7Y98msr53aA/p+tokq/ZCGglPXXUlEd3AxS5jyIYjpJoCFKZs9
	4ZtqpN8LHqpImLsH9gJePGmgNjJI7qnF58nh1E/289jNP5kd5PjHwQo5jsBatSZyWRUYi1xltRy
	C9uSRrDEf33t6XcaawDH9dIerSV0QTEpvN1fM0FRe41aZCriJZnz2SZEcsNL2lmZPhYpL6dDzNX
	kgLvp0ZDRA5+XKa2sry27sanU3RoYhANS+r4tipPCF0MtKgbWIalqJ6BA3RRfj7jNSE6snwrJM4
	v/4rkyVvUKpbKthQFTYNmamf48PbpI2FqD+BH2NaJrAI9IRzCEFwRUnUMntk7/d6SeCPVhGMx0L
	RP8lvE5atzwlo6x5r/6IJY7d/kPHEtJQgymOrvcHouT/1xEncaFKrFgsQXA==
X-Received: by 2002:ac8:5f49:0:b0:4de:73b2:afc7 with SMTP id d75a77b69052e-4e576a50cc7mr55876301cf.31.1759528511040;
        Fri, 03 Oct 2025 14:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDhqAUHWqgc3GWJMbiaRjW8xbw3rm19fuPkKV681ZbMoiAFDWogDl4M0uVMEWO9gO38ZJtKg==
X-Received: by 2002:ac8:5f49:0:b0:4de:73b2:afc7 with SMTP id d75a77b69052e-4e576a50cc7mr55876051cf.31.1759528510423;
        Fri, 03 Oct 2025 14:55:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6fesm2186913e87.73.2025.10.03.14.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:55:08 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:55:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Message-ID: <sarhhzxs77gthpap3vsxidvut2bihtmtyjecjbo7dgvglwfd6s@yt2w4on4f5zw>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
 <38c70e06-f7bf-4ca6-8fe9-2a4012017cff@oss.qualcomm.com>
 <64a732cdc3fe9381e2f716be9e965fbc905c1416@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a732cdc3fe9381e2f716be9e965fbc905c1416@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDA5OSBTYWx0ZWRfX8VndahXk77wO
 m5f2JewlVjvv3bQKD466S1vxZYXy/nymsh5SUTOyjrJsepPtQovw+PBaSm6SLLm6YsLvYqkJnrQ
 GB0J0m0RyypdE+Gnv85fXL1Sv7T+qBwhxGwObFFkBE4gydPA6Im86p+lJzPxJdiOAkCVAUYyd3h
 soG7B4Q9g3YczHNPb2BulZ7MYYkp+bj3NrDtLOlICmEY6MTpJqV2xVI3azCTbTE2qgBRY9saoj5
 Hbi9NIxPbwUHXhOhGDpx2QpVCKD4zQwH8UxPfaPbBdS1l3RL8cEOvSOWkc/U3N57pNLaQ0Jn2Js
 WdMP/8F1s3enxTdCZFQ004LBoXt1xrOPCrst15XLoQv3EzXbCRewVLOmtNkCVSj10BUSU8o/JO/
 WBH1HLTXFxafO5Q05imfdy4OU4e4Hw==
X-Proofpoint-GUID: lhaDWE_QSBW1uMLYzhepIbUHL0J3qhTw
X-Proofpoint-ORIG-GUID: lhaDWE_QSBW1uMLYzhepIbUHL0J3qhTw
X-Authority-Analysis: v=2.4 cv=YrwChoYX c=1 sm=1 tr=0 ts=68e04640 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=z2rhz3lDxe_xYuXa6uwA:9
 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030099

On Thu, Oct 02, 2025 at 04:55:44AM +0000, Paul Sajna wrote:
> October 1, 2025 at 9:09 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
> 
> > 
> > On 9/29/25 7:05 AM, Paul Sajna wrote:
> > 
> > > 
> > This patch will allow any values between 4.6 V and 6.0 V to
> > be set on your phone, with the kernel defaulting to 4.6 V at
> > boot and staying there until (if?) any driver requests that to
> > change.
> > 
> > Your panel probably expects a *very* specific pair of voltages
> > and any deviation may cause unpredictable consequences, including
> > magic smoke if you happen to go over a certain limit.
> > 
> > You should most likely hardcode that specific expected voltage here
> 
> These are the values used in downstream android dts 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/efa8458f79dffeb380d43b38b9403407f87d9f05/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L484-L485

Downstream frequently further constraints the regulators. Could you
please check the boards's dts file and the drivers (SDE)?

-- 
With best wishes
Dmitry
