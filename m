Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E96195FE8
	for <phone-devel@vger.kernel.org>; Sat,  8 Nov 2025 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762624124; cv=none; b=DvaIo8wx4bbl8AQbc1rK4VdRonSPKbjrOyb5A8msj6ZM+d+mFfAXqmPdfvdbUlIJFxsdhU/PrPmNUItQuNMRorCDqEPD036q+wZF2quUkl68tZ83ISARDpo4UwDd5hDxBTetl08DQxNVxVuk98wUiA8At9RkoHCT9FT3pOc1Vk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762624124; c=relaxed/simple;
	bh=wstHiNMcujFNhx99Jgc6AiOxnCPcdqeq3Vo4mwlMDPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ux9HBM+LUeU38TRKBIf9Op1xIoA+itDoSwrBTpfLX+J3Vss8TVvbhhsrZx4vHLb/Y8jXOuymc1DEn8vYBnanfIzPHs8Z+54kl/Td/9ZiXnt7GTcEiK/dO+SV5IDgDKAGQhhRphVOE8rQqWC30Hc79w1mjRTsXfOTM5H1S/9nxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsOJbx0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJLMsb8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsOJbx0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJLMsb8Q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8FpSFt2366709
	for <phone-devel@vger.kernel.org>; Sat, 8 Nov 2025 17:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p9VIITPBI6FH+3MumQYzHuBc
	LCwlSNsZGEMhVh7NkDA=; b=lsOJbx0UxlWHi0jz+ZnkYAcMJpTnqcX61J/4qV+E
	lzoNA53n4mHp4HKHDXsEMCEcaE4MruwYoUhU6tQ8E8eXrfk4ZmoPFOieZ5fCVRK6
	64kSDZS2CWDYjpl0dUhCjDKwCEAINF+iqDALjTuEMyJfO20mDjy98F58GRjmvO7h
	l32SC6YDW1VcBEsZtcLvr8iMJbYagArFo5NBjgw5PQvEas/QzG9RrBNvdouENtjd
	qtikQD7T1mCOp5aZ7wS2iVtMfQU3e6JLnADn0QRAzbE+H13QTjFk741s1WgkPrpR
	X58+5u4US9ouZaWoNZoIgP7sFKd2W50XHsz79tkTxF15mg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xuegxrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 08 Nov 2025 17:48:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eb7853480dso45598661cf.0
        for <phone-devel@vger.kernel.org>; Sat, 08 Nov 2025 09:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762624121; x=1763228921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9VIITPBI6FH+3MumQYzHuBcLCwlSNsZGEMhVh7NkDA=;
        b=GJLMsb8QadwOsi6lldyEE1bab6qwEVp8EOa3xUllUl3rLtflefzxU/pXLO1UphfA0V
         iy2SLBoF9ssr4pwp1hGfDyDtLLAc7oCCROlwoVEZZAMRdIpHJcTbx+DJmnPeWi3OEcc6
         koIlW7QAyHY/gXpcOt0YoYKaLy30LUUfN5UeNI/UFLHE5k4O32XTcCFCnMpxHiWpNlJQ
         u9VI83w5yDxbtvR3rSC1ws7CsbgXH9+xYX5LYU2tUmFiw1HB0GR5mjDkoeRGsUPTJE2A
         WqACD+EPkV5gk30bVQiSDgYFJBZPjS3UbjNCc6Qch/IX/EA01PZTZFwuaJDuFmY3AK0R
         MnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762624121; x=1763228921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9VIITPBI6FH+3MumQYzHuBcLCwlSNsZGEMhVh7NkDA=;
        b=Ycc8hV2vga2+tBUPgqNOYqxot6ueLBzSX8TzEdpCUdXhGFWR/qUWYUJHSNI73O2i6+
         7n4Nj12QK3uFo3CBu321D3H/fUwnffQS8E3/EO7tR3n6tlG4lTCcAbJRbqClOH4OdjrH
         4VuC3G3wAV5xjVFNYQOUD/WYbuD/HwlU8+aXP8jGx0Hc3iSd+9pXDENoWholqSfAX4T1
         Vh8kd6Xd/HVOJh9bzSufxlah2nBzsKN67r1K8hIR8zyjo+2pWUxvhhkJw+ZMdGys/tI9
         dbCXTXwUV9CAIpQHIOtK3aK7+ZFEW+59cfMjVaZwYKRLFjbQSU5NiaTYsCPluGhAAC3n
         7DTg==
X-Forwarded-Encrypted: i=1; AJvYcCWFySHjq0NdEhncq0Za9MUjfRt8YSeKiU6T4lKWtUCVd9ySsqZbs7RPncFXxby75PcWYrTBb2gMO1ZTHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4WLix3lOY0hCAxQ5/7nctaYSzrqw2UjxtSd/eYSFxZUVpodrs
	1zrvhTrNeddJocerfo+1dUQo+MyMDXHZw4RSIdDvd0nVp/tRR64UwvzIErm4b98ntwJ2uZAe/A7
	Styug4UkbbPSGR2iR9m8UirklN59g2TfSqFxs6Gbpzv5GKdVyPsuQ92kLVAPQPb+Cjw==
X-Gm-Gg: ASbGncse1s7Xf1TEBf2TVM4PWaMbVTuHbzLZ2ih9T9DR9mxCXV7sZeKOm64sWLDZPqa
	rY0NLtb+Rbe9X9Wmc6eFy+edtqG7mRClKYq3Qt8T3utXDYw8IyYvSf1mmJe92cpSomxddb2nf2T
	VY29WdgwWCirCvwgO/FfscbMYakmBUXVxOCQqLs2i6S3mt+tLzifAk6yag5aHTa0q9XDEYsF/wi
	f8cPLpDRTuZHij2HPdclOCHDJy4yoHZfLkVllr6NWvZV6tbQzp2mGY4Nvwibsu7qba+14eoAqtc
	ctX7bfgfitHJCz3NDycv3Us8Aby9sadK/VbfFrW9BkCWt7l1vJOw650GMwk0isQ29IkaXLOEUCd
	og4Ie1vc+tZDQ8D/CpgpYUtW5sEuz4UL/Dc2vnbI82coRlE5KOftc1roZyUdJnxD27zkzCleOor
	6pca0WjXjpWcja
X-Received: by 2002:ac8:7f8a:0:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4eda500b39dmr44706571cf.81.1762624121146;
        Sat, 08 Nov 2025 09:48:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3UX8GkmdwTy3sgfmRIRR485zCV767sy17zShEsRHghjOuKXUPgDs+3aiNzzZLVzaET00gqw==
X-Received: by 2002:ac8:7f8a:0:b0:4ed:2edb:92b9 with SMTP id d75a77b69052e-4eda500b39dmr44706331cf.81.1762624120724;
        Sat, 08 Nov 2025 09:48:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a594e2fsm2334143e87.99.2025.11.08.09.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:48:38 -0800 (PST)
Date: Sat, 8 Nov 2025 19:48:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm6350: Add clocks for aggre1 &
 aggre2 NoC
Message-ID: <5vrvuegqb4jbd5o7ipghrhxpfx57e4toj4vsplh4imupkc5emo@2qto6v4ftqz4>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
 <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-sm6350-icc-qos-v1-5-8275e5fc3f61@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDE0NCBTYWx0ZWRfXzmSdrPsEtiIg
 wnuhDdRcwfDH45oe7xC0ZUXfXhKLJYm5hlRE7FZXcAxHAMJ15Teypyx0dds340VEr4BNw0cMFGL
 CyEvd5qKf/y7qqMswtMR4+f3BrZZCnl9gpaklDDyGozMURuCWshSTABLr60w/xF3ull4/v0NlYQ
 +8q6BqxpIipgq3G9kU/CcxTEwh2+34XH4Gz6ZIIQhlBSwGiyXOqgwpxUQb94B6TpNOw2ZTo+u4W
 ZQN9vtidXNck5iKL0q/+Rq6OeYb4IlG1MipOAZXe8vdK2AOpIQeW35AAAGD4Qi6GZ4qt+ez6mEU
 F9zGUCSMAWXKmMcwN5IIog8t3fvcISIvCAv4GBlViucw4MLZ8mwdYr4SBaDojWgq0zPnm5gSSL5
 dUdWVQvT+4leMrSt6jPpwpl5/DpKvg==
X-Proofpoint-GUID: QWN8QuFnez0WtOV14KQ6ijsSA3VqBHHM
X-Proofpoint-ORIG-GUID: QWN8QuFnez0WtOV14KQ6ijsSA3VqBHHM
X-Authority-Analysis: v=2.4 cv=BOK+bVQG c=1 sm=1 tr=0 ts=690f8279 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=B5yIxIZ4dO-XZLLuwIMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080144

On Fri, Nov 07, 2025 at 05:08:51PM +0100, Luca Weiss wrote:
> As per updated bindings, add the clocks for those two interconnects,
> which are required to set up QoS correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
