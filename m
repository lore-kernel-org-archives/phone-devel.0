Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BEC3DC4B5
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844922; cv=none; b=RLJwM4SKYuJBiCuDom5D6tbPwPFHbt2RmzRUPe4iYdRRL5gyFVDZ9729AuMPMr1CFngdfOLGN6eS4f6Pb70/tFWRlbWEKuJPOV/gjHZkSPn2j0UPVGq3i6E/QuZTAilMGxaht1xfZbl2PLVcSTbFnd10r61t6l0gw38LOOneDNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844922; c=relaxed/simple;
	bh=88/4tD1UMvGQTh10XCNWmYrjiU25NgdqCEgiupFb7RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6Za5dqwI9e120B0GN0mABCqrBKFG015QAejpIHX56Etz0DonIZ3R3Fi9IfupJ9ZXyQik3BgVdNR6hiDnHhIHU/5XoVQaVJoL+t0siz3vDt87+5NHKT+HLnWL7WhFgY/CYvnHzMmKup2FDLKOQEGXRnUgJB+ktibLLS/vy513aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAKiEhoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqmqsVT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAKiEhoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqmqsVT9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi7YN008805
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UCVtWlsO3NLtt8U2SVQN2B9V
	E1D5VvmX9n00rYrAV7I=; b=QAKiEhoL0UMDkjrpyb2DlAFGsZijCthbMZWSmtUe
	Qyj9XYSxMzmnghE/0bVcz0PQdJzTCI/0yVn/X/m3zKZLVSHkiu4yXVp23CMbBCK3
	Hmw6Wm3CTt85uup6i5ChgxP1Oe8gt/7kn89UNyLEcPoVPHJ6ImJZSCM93atVVzCp
	M8SuD7/gKPmLKWyn8REzGt86XBklQaKhvdZXIq2be/zVS/nRVGltU5bjRD7k3V+d
	/qi9o+oSZzVDjwLs00mNi3U46qUhLBnHatvV3ROZB33aUrua+9BIA5lT+s2prqAk
	PT2fVJQseQQL6SrQf0yvNwRVLUbMWlvMMROO3JXKYv3znQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50v0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:41:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091ee9f1d8so72288531cf.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844918; x=1774449718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCVtWlsO3NLtt8U2SVQN2B9VE1D5VvmX9n00rYrAV7I=;
        b=LqmqsVT96YTrPF0v6joUnR2Y0+aU1tDfISwdVZMyXfqL4zF2x+1HdXhMYXieWwuqjG
         bX0ECqz6hUwX/igVJcYxKPwJx4nlAd2OGgoIlMGzYnV83FQW4TMWHpeKcBOGGv4R6/a8
         63l4MVJGsd8qdZehyIplziK44PKwYrNSu2oFWJIvjK2g/p2W7SPOsE39K1UqfFV1ZCP3
         JrpvGy0KbYqLBr8quypSSNQZCSp4xe/FPfDXTIFruyCg1IAB/z939Hg7Blg9vQ0wpIKA
         YIEd3u09885h874NcVgsZyQbZyyMNRiq7K8L9YOhPBVfpa/0VzQAtot6XfwarDhI/40f
         DKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844918; x=1774449718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCVtWlsO3NLtt8U2SVQN2B9VE1D5VvmX9n00rYrAV7I=;
        b=ZO9eXlOhjKMcHX8T57ic8Dzfn6XMFTXnvXS/OiMu4DA1vygWZyLX69dKOWfHHkR2oy
         g7DxgjvS9blQbXIlxAoWPXIU3ZTHsk/MmGNPzNeO4mPc6nddxoT6VHPAm1zfa1Wh9X0W
         eDzTbsCdKgC8XGwQMtAOhAn4HnOsMQ2/I8AjC0wsQhCM6shJiWYpomMEdEGnbGZzzOyD
         yogSvOouAPlJzuiTz65XOymAIAi87YITLiR7/XYYoJ+ORTSyFQTa3yQWtSGl4ttuzLmc
         /9lNZICF3JcIScSGrtTZb3M3VUVxbqTkjsPWnHN9HFF7l46X8yIWnwypKzVAVVJp3gTO
         g8Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVXcjTzbWO+i/a4Cr46m/MaS51WsnEjBT3JLGn5fI3XXwtBEtz8MtZ8SCnz2vgOmkMlxXtUDpz873zM1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKu/KXDou3rtJhp+mQa2JFCJKJBOnZd5p4KYmZLMXm/8gKYJug
	dShxNtSra80m1KFp8f5+aYtf1XwlTrfTwjjBB1glyVwCDaLRB++ZMCMJb98oZ7vMUw442mjLSWz
	CDHSU5okpvgG+N0OvPRsyH9aw3vO9AVASn8FcBHf6xTGpmVnnTc/okU0r+rWYnJihyQ==
X-Gm-Gg: ATEYQzzDF33bulnzz+N9khRERoOUhqgO54TJexIPEGHWyozhu0WNuH0BiakbxKspm02
	PmA4GrNGOaD4b7SkQIsLD9hkBtB2k5bB0rZzcvP8Mz7Ov1UxzpMHRGVNmRD3ievHXVaIBl+MxUG
	uCVjALUujcmTF98Ztc6USpGC9Gnw7+F/Sg2TvmkSR2QRKclfJ2a0f+9df1fqcMlWdDXP1AH115Z
	ZLGu5OGpVQ97vYtcRqFGURTMp1SeNuQ9vaoCL9MaBPi1f2UVmzDPEpkDsMyRQvIRlvkN7v/amDS
	A0fBrKbveVQ5uZLeHUzjpsGMvoko5Kqf94ZWR43yTOhZYZwfcZM5gtZJ3jmAUGwK6AVjUdRHXpR
	NYaYGeKMZQH0vIsV7yl4wbwcJakUnhDQgPruv5NVG6tkTdrFhJhIYU/imoJUFV/T3/Jgm/dQkbQ
	IRY0gUACYwVtHDBcDvvKS7H0f5yTxw0Tm78ec=
X-Received: by 2002:ac8:5a02:0:b0:509:19b2:b713 with SMTP id d75a77b69052e-5099805c3c1mr93562231cf.18.1773844917958;
        Wed, 18 Mar 2026 07:41:57 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:509:19b2:b713 with SMTP id d75a77b69052e-5099805c3c1mr93561831cf.18.1773844917510;
        Wed, 18 Mar 2026 07:41:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a27a987d19sm464670e87.73.2026.03.18.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:41:56 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:41:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sdm845-shift-axolotl: Convert
 fb to use memory-region
Message-ID: <h366xpuwwaghjbk4rv3b3uzlx3l2nhifiyavhajj3lce4eayyi@twhjgncrshwa>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-3-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-beryllium-fb-v2-3-36b69dfb760c@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNSBTYWx0ZWRfX6oSuY0mK6a7v
 nm3hszVKUEjfZhkBuMm3igWUTaiL2CdS6+JEgJ3fseUyYflzGkXIYG1VZTLkxo8QVdgCoGx3RQR
 3jcZVELdcV4+cymJeSvF7DXz0wDePr4xxk+OYZIbCBjklVXIgsOjYd98plP22tqoTjJXtFkNYOL
 CvzL5KT5/mVB3eh4Rov77xs3fFbC3DOeuarapncKlKOE/op/TYhKpBQsW0tKSjHE6iDythYJStn
 Oi7CBnvoOuTjf7YTwmXu0HpIpzJu7anSIvtttOUdhSeEogysDawiWbtKjJ5kujJ2Q/M74JZFTXM
 ASqlQMm3lVClrHBRYX/S24abVz12CCi3hl2l1JkEMFPQsPB3DcWchX/TBD2G9RDCeYW5Asm6csq
 S/RwL81NQ+eXr9O25ZKK+smTxEESJxUSzJaEQ3mxCgsjxZytGDEqk4UGGcB6cICbiLue/96UKnN
 cCB/s00XcVkUUbPLB6w==
X-Proofpoint-ORIG-GUID: 3ZhoJJvY_S-NiqAHPQO1pyKtGHJCZdVz
X-Proofpoint-GUID: 3ZhoJJvY_S-NiqAHPQO1pyKtGHJCZdVz
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bab9b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180125

On Tue, Mar 17, 2026 at 11:12:33PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
