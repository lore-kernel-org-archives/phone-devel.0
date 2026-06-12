Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B63ED5B9
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270575; cv=none; b=VNEj7OqNuKnwyeld3NetVYTdD3OS4fXn6+T6ly11ePc7XLxfOnXH0uL4MBqRFdwj8PJLoaXMWo8GKXrXK75AbeNzAmUvN6TvQMxOLWzjX1FjijofwFl9RdJdVY2sBoIWGzNGE8hlKKmeBEJbEsBOBxkK3jjrnYNfHebu9Jb52Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270575; c=relaxed/simple;
	bh=nf1g+Fqp30YmpIaTMZMXYpVgVvbsOlnzP3kXNlN79yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PW7qTlFo6lx5FKRYi73Xivxb2Lp0rOhsxwjKPVa/WlBRLmsjH6WPStEQovY121xrvbzDL8jAOKtVho0ya2Oohl2UtruuKlzbQyMZCMvyzVes/3I3H+kqczBAI+HBJVKz0lrioVBzNpEKPQ9DCxLAm0zLjnTXhV1YVIyaegVLT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+lCBWFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSe3B+oc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+lCBWFm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSe3B+oc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj3B53733287
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=221wATpxxjDRdtKDabS+fEkS
	ffVXjJazSuJCFsqtxp8=; b=H+lCBWFmNNU/QZcPhIq4/YvZRJ1iWT5JDEdgwwhe
	IBZ7XSBZZi1iUvCHaRZeK1vSB3napk1wahd0XfYRlQHF+y5hgXN6hXG5IVWbTQ+C
	8b8Idv2+6IB1lyk7rcmZA+ymr6UkS/G/QUnbbLL/9VriGT+c4W5Qv8ymKUgNi56q
	I9c77UhJEk4Z0Dsf0qKIg7Dzptyj+vy2uOrcY0Gh1EDM+b30bvlntXIBtLEVbTmN
	sWYSRBkUo3Es2fK71uewQRQZ3nX9f5TvFkjNpgvtUuKbRQwD7aU5HSBKc0xsbekQ
	yRYx5n3LoMAsYBJ655rFUytFEbGVp2lsynKb5H375Cr4uw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r72xtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 13:22:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ab02fb4f39so505011e0c.1
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781270572; x=1781875372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=221wATpxxjDRdtKDabS+fEkSffVXjJazSuJCFsqtxp8=;
        b=dSe3B+oc5l2fLTZ5Qz5X8V46tlh96N+bREE5mLLwhhvBhlLNrFzLSRvTl4U0UC2Bcp
         9eXC4SbNmnbvTOy799ncq1BnMSOMC4yCdw1K2vo0YvzdyuTYm8epQ8DV1tWt4OzBHLBx
         fjXxz91/46UwBeowlRLE2uVBG40ww5qFTzdiE/6nOkVHM1ifUAWxP/1XoXkDr1Q/4i3Y
         3npTVoeQvQxpcvUoaJX2yk4++CC85IRjt5szigQKVeuRTSZuf7i8LTuQjetNSIyb+pXR
         nY8Sy3nPsV/JLriVIqxI+bNUaOTUJSA0VrmiN2bY1/p/H4nMXboZUCr3s4SsgyQoDJQV
         Mlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270572; x=1781875372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=221wATpxxjDRdtKDabS+fEkSffVXjJazSuJCFsqtxp8=;
        b=JqhM/O+Wr5M1fPxI2DGbaukjmG76b+clBmo4yaxIqYU+X9++ssLWXbatvb0ItWOnEn
         Lrqv1DBTv6RG4hh6eTB67+qA9+aHBC4N29xpW7F5vktddW/hZPMxbWusw5D7zUOKdRBg
         zaY0JzHS7xyM9OlPiHlms6xLSz1JQsKaTHy2A7RSKbhXgIhWSJrAD81GJRQ9YrA13/Lr
         s7sodqU/lov0yCH4oPAn1d0ZKuvEbkXhfyDqiESatU5Uxha9wBzSXaJzXQfEeZWNusdx
         mQMRUKW8uyrRC4UVC3RYl8TSgnAyJ+pwLizL3SkINAWAQhGIGJS3RGRmOQXYuS+YzEta
         LLgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ea50cHgMhapxo5B0XVPdxlnTI4Yu+M8l0jQVORiRHQ6rvRdJBuy/TCA8oK/WmQu30SyYpk2Q00GyAlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQTexNCJEN60YSGbiMKVjwR6FdSK2aJxfquobS74e4GYNhJB6
	Xq1BIWoHIHqeGCCHrWTfPj9EOIcA0hnDD/bBE7/jNOBM57HK8cOHrw8p6cLnxNMsUY/SjgR3oPm
	bqcwouewf3DlSxwAetBje6xp50zZSnGMPkYyZr7Mb50XgQ4Tf03GiPgc/KzLHJM2bHg==
X-Gm-Gg: Acq92OEGx7C90ICIm0vj46ly2/bUn+emzE/7urhVhUZjUDydcgRLGSWqgFe518yyBOu
	Ko0pg0tbH81suGuGSQgwiB/bANEByicw1yaMYwVAeeRsSXoaQymiH0SFk17pVgJfEa1z8MItaHa
	+rPxpst8kB16POF3zsk1RcG2j+b/lCeTDvtLFpUwPc0RqprG+orHZs2bUwLMMIBf1Ddbc5GLk9K
	85QyNaYezV2/8/OpW03UxgZGNB+kbqw36LqnmjPqWo9Yr1XAXuYBIJOOlyG1oer4ehqOHTnMuOp
	ar2CYsSAGyFnHiRZXv9E9EBVv14lca7v1qtj1E0TR7cOGZexR+e0+3ql7Lig7ak5K4FM8SVfpd8
	kWfKDNuqUyJhU/Mj6h2RPFCwOjULyj/71+1vwqQcWSnmLi6uwUVSemLmGEhre69zW7LioWWMck8
	nTCyrCJ2bPT6P6y0sE2ZYir9/vQ+9kMnSwQKw=
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr1220322137.3.1781270572410;
        Fri, 12 Jun 2026 06:22:52 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8f:b0:632:29a5:2b27 with SMTP id ada2fe7eead31-71e88ac8d00mr1220257137.3.1781270572006;
        Fri, 12 Jun 2026 06:22:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aea92sm532555e87.63.2026.06.12.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:22:50 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Message-ID: <qc3khvuiwllxkaj2btmtevh7vxvdkcnnqemetvh7mqeuoe6ieb@7nkztniqusxu>
References: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
X-Proofpoint-ORIG-GUID: cTNJm9_Yf8_BFQ9dd1HFxwxPpElRohvm
X-Authority-Analysis: v=2.4 cv=RJGD2Yi+ c=1 sm=1 tr=0 ts=6a2c082d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=DvXHit-es2HtMH40iYAA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: cTNJm9_Yf8_BFQ9dd1HFxwxPpElRohvm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX7mgTZsJ6wc7m
 IpiyOgI2+ukpvkNJPeDH6GyhVoIJdPJ+GiSJ9mFlHDXwN5qhvztEh4RCuKNKOSLu11oHSIAECte
 SJwLuKdLIPZ+8L/6uohClQB5qlhV8296pU5Zw4odN9uFQZR6PrbRAoN35lMqAqweVeY3maj1o5N
 AuamygbBLe1/G4M6klRZ8J2QjuaRLNvjeZYrpympNwEKTG94HQMHobw1UvEc/RenKmFDF5/rzrc
 xUAZKQRWxyfGhlIKg1DZhNI6Vi88HnMYyp6gwzGXnmkRrUpvrwhkqFhR6qiPB6A3jc6eo/Nat9j
 8qWxZAwwSwo5CWwQJlFXic/qEOmS7rJhzIhuP6S4D1qU0FmPtpPUu10hRAdwQqs60z0EQvZM5zl
 YdfXJfmGgVoM5Yn4WyH3lRp4SA6xMr1LEM3TIJY3rXpHBxOFEe8vwGH/D0F/rYIxi+WuOGW9YHq
 KyOUA+J9GW12jn9VHVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyMiBTYWx0ZWRfX1zBtw0ZDypa0
 1fsy9bBUceNctaXIm4qHKZETchd4wnNzAhYNq4R9Smvbf54vDgiY4ki/IRLWnen2fs3a6+7aNfa
 ZSX8PYAsVZdVyk1YaEOL9tG4g9VoDiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120122

On Fri, Jun 12, 2026 at 02:52:43PM +0200, Luca Weiss wrote:
> Add nodes for the two AW88261 amplifiers, for the top and bottom
> speakers of this phone. Hook them up to the sound card.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - Remove awinic,sync-flag for both amps since it's actually not needed
>   (Bhushan, off-list)
> - Remove RFC prefix
> - Pick up tags
> - Link to v1: https://patch.msgid.link/20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 57 +++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
