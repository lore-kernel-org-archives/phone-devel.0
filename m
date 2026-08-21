Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA941D432D
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 12:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314592; cv=none; b=OX3xt0twtw//N7acTQdFC2JYgox0b+gyhWBTWIWGGjxfq78SmyCqD22CG/c2rT81BmvQRCJfhQKDopSSaVfuKHwqXknQ2AhTXJI56co4CNZOwDPPgUE6atfm20tcIwWeSMr3HES0f4AdXBVyvua70Q4Oz1y6YKEfcvrUh+r+Pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314592; c=relaxed/simple;
	bh=es4m+wmD6O0W+VN7wgQ8sffnaTdgYhBLh3UIN2laXIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fi+E60gSlMOVwhHZ1ENdMfOmZDjWKKImi3EhnPb1zhwglBd5Bx8R2v+baW9GZc70ts50RvvAfgCc4gPqz9hYCzPz3QxUDpXIR4YthfeYqfFrFKjEdmgl6iL3oy7XgD1cuZqR+YvX+XiyZvWFhGln5ymkaQO5fuCzmKok1/XGOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEY/YKRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/tTn8+B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEY/YKRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/tTn8+B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LBpvNj2127750
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 12:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GOHaKR3RVBKb7RfCMkw1x2U
	2ZbnpAPQz3ErgjJAqYc=; b=pEY/YKRWaYXsc8/X+VYkCLE2o7iblD0/zIvHooZJ
	/HNEwZGAPe0zXvDBZmWlrWjfwcnXRyHDrV0mJNkI6bs7TgzJjbDrOiXzU7VTPdUJ
	VjHjvfRQT0wsTPiZrePTrQvOaYQO4uEawhoMH3iNw3dMfy/fsC7BQiuP1EJqYUmk
	1btyqompS70zkRWORkgHFgKfXqMFs7LTRzISdeAiuWH88eIpWWM7Mf4lxt/f1jyz
	U9bW94BZYA7UIbF0pPNxresqRd+31KeJen7tLjQNMWShcsWP2z+Aw5z6hVO8WUiJ
	d1gR8Odme+TFdeKS05lxRa06elbdxTu1m6+qbpKbXPRQ4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9ufq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 12:16:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so9826791cf.1
        for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787314587; x=1787919387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GOHaKR3RVBKb7RfCMkw1x2U2ZbnpAPQz3ErgjJAqYc=;
        b=H/tTn8+BDj72UkeKv1EZdzGGsAOaYi0A//xHZCn3ZKW1iCSKdYndca0/XwJL7w9eId
         cFwnN+bTRWYDNQRgg6dMgAh9XPrsGu+FwuylsBXO5uAmDX8Gow4xfrv2M4GwPKv8xvij
         gYTTE0ZMI9OL4J2rR7om28VI7DrNeRi0ycKPeCfcrcwvua0kBQzJBlgabDVmmjqUM9Ez
         r8ejO910ooKGplaj4J2/34YyIGM4PuCku9xmBQaS4ub++a7ijONBMJVKRe5ZvaFag9UC
         xzN5c9I5SaKqnPrJ0x5w8mQ0QcDJ/p2cz1eZUTvINl5OsREJk2CnmOUiPeFCSu7ZOe0c
         Eycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314587; x=1787919387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GOHaKR3RVBKb7RfCMkw1x2U2ZbnpAPQz3ErgjJAqYc=;
        b=QZTmSmFPvqrDDd1xUQqANHJjl0cAX8TAfdZvPk33u+MIH8hreWHP3YWPg7AzaSbvIX
         HL0OumJRXQR2u/wIB1EevF9gdvKpcE68mqkR+EgQ/2dGyC9J55Ug4lRoxjBbejhkMIiv
         +kUMAZclTvclzhmi9vxYN10TGTE21TiPPkuDZH2I0jUk0khQQglnrJEgsIJUvWk2b7ht
         x5DF0HjkJATWxmeXiImgGmvI1eHBm+1NKsEb5LJskHeeYeyJVzs9U41PE6aRCtSC/X/a
         uaXRMVduv6zQYJ/R38nisKHilLpuw3JcPUuncppFtajXrwVS1qpeiR9gy8+36LbRPC7y
         gmnw==
X-Forwarded-Encrypted: i=1; AHgh+RrRyr208HpSJxA+Nj0nhDZfpwpfq9Xst9rEkjWTU1V8WHruXyMnjg3CtCGuCG9P29L+SWmkJFiHJNT19A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGElqQXeKcpxWGajip/a22RKo+nWkYoeqzaJ3VgNfz5ZX0VFof
	8NmkMtFZ4E4lfplqGmE7BI8xJ2XWJ93S8hVy6zO4rruD9mAYGpBkUKJ9qLUsDalwu/6SJrbT131
	BFsnndKKcRYbuVCz2nGeKIFsTJ5bFcN2LDRH5Ne1ELWt5VAvaT19VF4KXzbsENXtJrA==
X-Gm-Gg: AR+sD10aj17DP43JkkMCrmNLXePLkEcSAuzecWtr0AuBSQABPEbqEwW70L3GU69y/d1
	fXEMImNKajDkXFk9TjpS1Pb2IzE0rMv37F6eeMigxaFQM2AKwUBBdUgvj1f2pb2qMpauCDSzD2G
	Om1GJ2h6sgmW+Z0xVnTX393OqEWSeRGCUwGhFUjW1vhY2diEjENVR08R72O3zm+CnkUvwp82/lx
	z++pEaZe0Ad6rF1sNPoFhhCiCkgJQEZCPcQE1NzWVyf1w/iIZquG0mCrBWH2ruAK2e14Bd/g5du
	a1xxrmw+366FV6zj84HWk/M3ykRMWfdmaGQseugNmtSpaEPv16ql2gtCDiVc6W7dp/NpmLNHzeS
	+Fx0J4ZN4qDPHhfs=
X-Received: by 2002:a05:622a:4d08:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52df5a5ede3mr53201341cf.34.1787314586761;
        Fri, 21 Aug 2026 05:16:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d08:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52df5a5ede3mr53200581cf.34.1787314586141;
        Fri, 21 Aug 2026 05:16:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm471695566b.22.2026.08.21.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:16:25 -0700 (PDT)
Date: Fri, 21 Aug 2026 15:16:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Job Noorman <job@noorman.info>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
Message-ID: <3p7avlj7fo3f7dcuamznmgzbfxiixnsrvq4qfma4f3p6jitikx@47ho7nom5uf5>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
 <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5MyBTYWx0ZWRfX9cB0K3//DQB8
 RfNScEWfF0yOWjZJx3+xaPwYbDvohroEPz8jmaPv6ZXYHXDoDQkKShgmCzxQq6hbVu76+rCC8Yh
 yFr6Lzpt9WWMPYrUy30FWF1lic4JL5YeRHQPK+obs5Ja5JV5o8aHZNYZzTVbcasIy0srrlHc4/i
 4m6qvR4gVDvMgwKKitTVg8sk7WCrpKFkIQREpZotugy6JOmD1CdzqaFSjmdBTshBLc5g/SdKREQ
 O1U2V/XjyHWYR9c3oGSClSAYqYWkfW+C/iMGBl+BBrYzrf0IQZnAiOI9uYu2C7YKG42qLzep+8f
 QUiodPvgvwRCaJbB4HKLYOA30wwOv3m7bVmPw3kg9CkIOwhjUBorNmg0T6+upPGdjOPyIk2gVJQ
 thXPgnmzx9KOAla1PsyOVw/89TOuFp4CIYhESEYIbAI2rcaEBTSiTOUhDPYPUcsHiflaoaLBGAT
 p8hHXnGEQ0DMSwgCzUg==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a88419b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: gMPFBjxJNsySWjJ7lIuqhUiVdf68CrEA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5MyBTYWx0ZWRfX/LQlQrfUitlq
 3fN0dw0ENuNWK8/H7QN+oWTy1vykZma0yx47u6YrOTp2fWV9EgkYEksm5t9JJaplfrtLq4c80bo
 vu+5btcTws8xS3gNRPRvEbM/5/ZV0cs=
X-Proofpoint-ORIG-GUID: gMPFBjxJNsySWjJ7lIuqhUiVdf68CrEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210093

On 26-08-21 09:12:20, Luca Weiss wrote:
> Add a node and pinctrl for the Himax HX83112A touchscreen found on this
> phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
