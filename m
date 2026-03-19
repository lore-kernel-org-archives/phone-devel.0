Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098F2749D6
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949577; cv=none; b=AuKzfh3P+pn2hs8HlvgjiZ5exhUWiglIpNrXHdf9SMHj7bCiIbNo2GlivAKZp6c8cYgrNp9JR/AoQgkawdpNwYmHx3xj2AhKPm3NnZUTksTKPnxMaw4Zplju7gHRuKcIC7wnN6yp2GSo73wQJ8U5Le4QEIwbNSbJGsiHk7fuUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949577; c=relaxed/simple;
	bh=MEDPbfK/HMr0VQs1sLXTRMoD3HYls5syH4S7qzUKiY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3cHmiO0st8dPCt9mWqrF1X684Wm7edcNYfu34XbLcVydPAoJX9qij6j71u0U/9+8JOo6Pg0NMkLWITJkt8Vq4QFCYjVIPUZZcxInT6QSLCu6qVzQEvqiR2t5hmo92LmK1T8n0bAzhzhHvKF7eZ0IzhyAd7S+y4QB4ZC54yp3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1AbAp80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bW57IsAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1AbAp80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bW57IsAD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFRiko1770897
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 19:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YikaA2lXUddAOVG5ZIVblF7p
	HmrAFMbfMDLO2Wep9jI=; b=d1AbAp80iMA9ieN+7abIZ49Q7PreH7ug3tsj7wpS
	76EP90vGh2TK1VWrx9osAKdd+lNhVSHvjgLTmqo0uENGfuP2N8joZWua3uxOZjB6
	rqIjlVcN+KjzX0gUodrRQsmHeMurbaSKXJsNys60dgKOcTJtvk9mAVUa0vkUOcAB
	XJjpM+FapD4dnw9wPTKrugiF4JAlJYRjV3AAFWkMQQci+Q9HyvTYTLTD8uGzIkTh
	nVviW9BlDzHEqn45QNVNaLIZaYHXyehQjkd9/IA6eVMO08ACvIO5QZGpFVb7VWDG
	PwQzMXhUYRW79tTQTzkOD9qn0bcB57aR/zuJSOWrj3jNew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75vv4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 19:46:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so126824761cf.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773949575; x=1774554375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YikaA2lXUddAOVG5ZIVblF7pHmrAFMbfMDLO2Wep9jI=;
        b=bW57IsADOcY2r5dRPjbXn13nWvqmFLIzPNev2KUePdzlDscuQVZocGhhFoHBw7pxLL
         kU3PExq70AgWW3WMpQVXtfKCz+Fil6g5mg36Hz+pHLkt2k6qk5BArOtC492zpJFlq3fS
         /CEu7y2D48bH+2spq0mfiRaYdRlwKWuzcyH1VK0U0Kmqp2UJI6OKqpCLVGY79bJ4OJrH
         LD6yPoDk3Cr8h6iC7Z5hiUMaKj2Hd4vZ7hHkZO2Q2nBqMQz0XpXWxY9s0FydnLBvcYoa
         6B8W8lN/J9QSwGPo5QUp5Hj3qwBwQigmDDL/naaiCQlyrKR/a4mC7x3YCDsoV7xzHOaV
         1zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949575; x=1774554375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YikaA2lXUddAOVG5ZIVblF7pHmrAFMbfMDLO2Wep9jI=;
        b=F+6JZEgaGmqPO7alYsJuupYA78CxTi3cOGdIL0vRg8I3txg+LJQUkWLdxfJMO/+W2/
         isCGhvMmFGCdcr307dEsBDSGYdbS9HdOLcHOK0m+neUqBDCGEQFFJVXLsVOJMjMO1iKT
         NYZ+JxVLClG8N0WKDqAxQ04MfvkvoVVi5mu7jqzYIX0Qagc61Zm5zyqUvFS52a5s07A3
         xpu9hm81DV0/ywtvdhXvXECLx64/2hQyJw+qil+EhHukqQ24s2li301i1GOX/FrBvvHJ
         YbhW35ADIgPHxfmYAeKpSAgientBM6zzQTgIiN4glAXN0F0fGRWqN93LmjHjTmBZLRJM
         qcnA==
X-Forwarded-Encrypted: i=1; AJvYcCVKyNpEQ8ghEwZLR/bDMdVgnsAbnYGFtMdp6e425fqzdzd5ZMB7peuldCG8+YIibmyfmUNIC01SzRYUag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUSewAPK4LGg2vDtBnpI5WH8VA+BjjTp/ypI33P6JtzddcIonJ
	s4iTss3/d+rzkCe9b1V2RlmSwlWu7mYgSwyW/iDeAopfYMhFR/Yx+W3sIeCebTBbVDVKXWJFrCn
	i8vzKaRe3seNm7R8jzplkNw7H5XiMhjbCIrh16O772K59YLr7Xix4MGFi+Wsh3qhtmw==
X-Gm-Gg: ATEYQzyIj+P8Hc7q93USTZi3CyahjXbuCQ+YeLsUnV4Wa0ugiRPoggelFwpRd3SgYlD
	KN/KeUJAasfcgxZGyJRiuyYD/7CuqY/bPBTu5x3EH2EfJjOmoAVJBdPh8UsXado91Dv8oa2AO1+
	YkyR5EWKuHDFymU6I69TDT4+QvPuVIK8WOS8ib1YE5v2v+4u6XNVHVCAQaG6G++nYvbV5OxZ/TA
	HJ5I/aE3jM8uf2tbGTiVaT/fF8LVH/Ums1RGNXskIvaItEPZzO/gwvr0+BheK2wPTw8X2vE51iJ
	N+BxRXZk7R8sQd/0rvbY7ddVn59rKX6klDGQuMX4juuoe89fi0ZDppsG0MYU7iqdM9VL71u9DYh
	YPH1DsR5ODgKM/JNzZ+TEt9nTf9UD9VVLHaVAQodGVHeN+gKtV+zpxip7CIyNlpjDS85gop1ADP
	bXen2+/1qcf0MdJ1vM2yOAFaKLIpib0WC+Jz0=
X-Received: by 2002:a05:622a:30d:b0:506:9af9:595 with SMTP id d75a77b69052e-50b24704396mr68888081cf.26.1773949574583;
        Thu, 19 Mar 2026 12:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:506:9af9:595 with SMTP id d75a77b69052e-50b24704396mr68887371cf.26.1773949573890;
        Thu, 19 Mar 2026 12:46:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cc5asm97002e87.75.2026.03.19.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:46:12 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:46:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort
 pinctrl nodes by pins
Message-ID: <qdqobkaqdfk6qe5q53tqt3zlw2swusys4jqddmyqgqwtpjolbl@63a4mfe5cr5m>
References: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
 <20260319-fp5-s5kjn1-v3-1-9cf4b8c09567@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-fp5-s5kjn1-v3-1-9cf4b8c09567@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1OCBTYWx0ZWRfX/nAx1mtjX7jK
 MjPzeg3GpwzVJSEpJ3GsFq3S6ct2wQ59A/DZygVESD+kUSnPkwjNk2x9fuhi89LnXt1zchFYEcb
 Ub0QuAIBkYUPoTmMa2Oq56Gqqw00Li0TMFAUEe5GR/5oXPSb2VKh6H75jqJPFXMRzbYoIP9m0nf
 ilWx1207jsofqtsg+Q/aHRiHdZ15YS8aIG6qmLmVlQZfO9DZTmkCI1mOVAQSTzVVttEnTwOf3Tq
 ZTj3VKEGnPSceDNYICQDLVG4gF/MbSFR2QuG5U7y2igvFYMABvmOzbFBEhjxKT3DnQmbvvKwrZU
 tSCWFC9GPIkvbDkfZKl+T0Tm8JfAHxmZ1FPyhdlg5H9fTrZVR+/gj9ZNXWLQ5yLPAmxLHVVM5BR
 BhZAjE4ZtTNjHLvEEeyufkvtzKcZuZ/2y720ZpHw7y8YPWJIeTlj49XDJGnG4RyQQI8l6OzK6Ai
 KZ/iFpCvU2VtAF3qP2Q==
X-Proofpoint-ORIG-GUID: -7Yv9v3g4pJwF1fiBag2z0GhDZ2eOr16
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bc5287 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=x2qkw7L4rmU9F7zQ9u4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: -7Yv9v3g4pJwF1fiBag2z0GhDZ2eOr16
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190158

On Thu, Mar 19, 2026 at 04:36:28PM +0100, Luca Weiss wrote:
> As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
> in preparation to add more pinctrl states.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
