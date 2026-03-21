Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690EF282F1D
	for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076525; cv=none; b=kbldSrKG7D4JesYKePqZ3JcuxV6N/+3BgopeQjjGc5pOT2zCW/MI4kBAqwZC5l6Cj2+dh6MeiFv4+baY2HyOr8K6wCht6wp0eMOe8GZF4sEHjGMoaccYS4iNyn/e7/bxs6QpcSMuz6n+tHlAn4ng9hJM3NJDAR2pQPg/5kcfWzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076525; c=relaxed/simple;
	bh=5u02XgnLOl1nM9VIRGqhIO5H60GCoTiXnFrL90a7cFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0hfKsz9Pz6qFUUUo6+y90bynea8rOdqKpY0oT3aXnodow8DlUrWwrFRXuXpFBbxgWPWO/7G7fF0AmWl0tn1+7N99oH2zZ5v6sLJOxx98rVoEmeh4MiQR9kmlIQaPmcjlRBR6P7Y+ZAEft3cNbNynNAHmefFG125bE2RtwAGzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0ULBMtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeZvsQrC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0ULBMtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeZvsQrC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L4n3Sr1229638
	for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 07:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F1+zN2bFuHDO4Dnbjwp7azYL
	oYdf87yVpewfEpXF2C8=; b=S0ULBMtmBntl+XYfrJX6oPnZULRmPPBlJZb1IweZ
	tRfk3xgyBHWdBz8ZkWKzKmzCm2zSacaUgA+lc13AZvsI3xgROAnbX5s/2G74dAzn
	0y5g0RkdAHDCa+9MQdsJeAH+Z9nnCl++VzStYZ1/jDkNa8s+PpRmgU3adcSNpriQ
	O7V27AjPuUNPObPTeHfWMtCxmbsHJnTfr87Z9bV5aI5848YYZ2bfecUXN6mgwMxO
	Vso7d4kAGYRB+Rxcw6IfAnsYb4PDVcnYyBvGNKJ8NGUuInNTWkFDbt8riyUfAecb
	RFNodmrq8PqNjcGArH0c6PJ/JDW7yTWnuUxhC6lhcIGj3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kdu88s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 07:02:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b43343d1dso41210981cf.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 00:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076523; x=1774681323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1+zN2bFuHDO4Dnbjwp7azYLoYdf87yVpewfEpXF2C8=;
        b=MeZvsQrCGM4479/Wdlx+cNltCGS8U9ooWrmQEfIgcPMN4XFy/cBYMzRVr8bv/OC1Gt
         L8cRD7CFmw1amxUcdNiGT8btfzMvMoVSI9ULWotbH7Ta2I/zrfdnvW1HDTfKdbsCUGq/
         xdeRbl6QQJmjkHysishdL69Gj/msqL+dCWWoEmnTGmtPNSZh1u3Xq6kuFJGFoiV6/Ztk
         S9RxwsbTiWwn5dw2/Br9U8rSUDx7xX3hAJdPdqEIeHYg9u9tiVgYypxhjUcwwzFvegve
         ksier8LX7yp9WHFrm9GMSHSkYXT/acr8TZ2yU+aLxh6czHTURGLuUaL4jsm0r9rifN15
         DsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076523; x=1774681323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1+zN2bFuHDO4Dnbjwp7azYLoYdf87yVpewfEpXF2C8=;
        b=lgo33xS3NLc+4UeMF8JIblSB00WOyzCGBKMA6lY3Xy8QjV0xPPp+h9qWOEbD0HNByd
         2rSLuSwAR1L9wVdcGxAtdH+8Zytvo54TdZV/xGWfLSs0jFgMJ2SfU/8DVZ8zGntEkiNd
         E/DisuRzzCy7zTEnoLEf26QIcGqrWH4IZrHHIZoCPnwzrfkWs/FCWhJ08nn9OkeFMPjJ
         gEyFjMq7sW/dIIYZ95RkRSUVfs6vJ7XHLUCLXGzrmM28sXj4rvrUIb7WB/MW6FVZlBn9
         hwZE9JBa6AXs3ARvmLOhr8u+EI6nHrQuECOUbLMeARsAcnNXQcRTzgAReW3TlGxR5cRc
         VD0A==
X-Forwarded-Encrypted: i=1; AJvYcCVO+Sj+sx/vLi0i/Rdlb3sn+gXUQ9Lhg8/xkff5JY+FvS2IvAT/ELXCdOaSDK9HmndcPvYqLcuI1mMcHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzybVs50wi5t2nbAhf0a2Bca6+21dP2Hfxaw3wzScVuKpx35ENI
	9YbCRRAtTyzLbrE014SrU/WM30Lh3Lz4DROJAbFk3Md1ypDZUOQQaUqNNaxyZ97c5Fwh6zs6jid
	odQEPfOOA1/CcJpaJatgtqIPKw1WWHs28y3t2lnQMWxx3q/dBOY2S3p2cn1dAJKwrzQ==
X-Gm-Gg: ATEYQzzK46cpad7EiorahlmSwyTSwIqIhuLZ3LBU1Iy7XwzPbVTW6Vme+c8Tu72mOqz
	sm2qVDy9kAGubmvHUgiAP6dbbwF6eD7zKh0IBuRPI4VMQSiIeMOcgAI9FEazZJZsxahKt9Cz5j4
	cRcNDTm0TwDPbqJLIBR8K1Uz8VyjUv3uRdrQoJFqdR+GNuVbfwJl16tFLy7fuhwsbxsb4JifHj3
	CxYaSgjQ+hTV+kzV9EZEOkP7PAJHMvWoR+/Y9dfN/O8tw+vBBqatCNAiBtd5fFH/l5z8Hw5BoZE
	1IEaj8cHdowjRvwlPzzcURZ73gP6yOEvMdlSPnw17y3G7lBzywDlzIjmpb0bHCUlGm177uANSl3
	1Z11Mpv9i7XGfCA3FY0KiS8/xfTyBirDq8iGcYrMA1ZDUxkf0mw+xhFleL544gX9kP0jFpoQPXO
	8Zoi1YNAne35QfSE6tI4EhcYZ+/+ErvHBRqno=
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr86368751cf.67.1774076522878;
        Sat, 21 Mar 2026 00:02:02 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr86368551cf.67.1774076522385;
        Sat, 21 Mar 2026 00:02:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd3dsm988211e87.73.2026.03.21.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:02:00 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:01:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org,
        Petr Hodina <phodina@protonmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
Message-ID: <gdwkcwne5amodws3kh7jspcrvf56fivj5c7per5m2vhfwbcb4l@kd665sd2yjy7>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NSBTYWx0ZWRfXxhSbzz7JCkjP
 WDb8rHSGXfkHv+OG7Qe6sCzPb84j14Z8Y++BHcsHRS+ksWG2M79ys4V85lsxqxuG5QBQs5qaRjW
 kKH7QbAln0aHWZHjl7SHN60X+MF4U8sMd1+0FkMlAm9RY9BZgw5BqhZmao0cK8fOQZ5gZ0MGEYn
 BQNmFUQtw0AzF2QjyyceZDOgyZHsI2ozWMrlN0nN9RITZmP+/437w+Sgk2mck6zoKChgumWTS80
 AfHVkV3P7keKlWz6dv4vGzqCyBmDYBXxDB6aXdXqcQkxIOHyWDrlbK4MFPEra5uaqPvX1yGi8Ea
 gIo3Gqd7FYAZp+9ydEDUfj9ous4D6lwh7vDZ0al3rBgsg+6CY5oYledhbxNIw+zt057VstWgR8W
 4Ld++5ucagM1/oiFhaVrdXtlrS5l18ytYsV5fjSOWvhcQ6vrjPK1jUX0KuPJSd5/mGOViRUKTqn
 r1z4La2bJ1rByS9zd2g==
X-Proofpoint-ORIG-GUID: 7FbfzHEzy7NKQHov_qy9zbEYKkNHqmaB
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69be426b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=jB8_oC6jW5EHyFLWiXQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7FbfzHEzy7NKQHov_qy9zbEYKkNHqmaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210055

On Fri, Mar 20, 2026 at 05:29:06PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Sets a higher rate than the default for good responsiveness of
> touchscreen.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
