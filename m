Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF12F90CD
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017460; cv=none; b=T95YVI0pZKf2PMN3jDgsrbSR0DIE1gpXLF2DxzJOua2rQwh4ZbNToMVidd4m8p3SDdCWuyQlA/Da1sPoKQwz530l1w68lJE7DAXwv0kyuAkbjUetmWpB4JdZ/Dk5TiLDGwsPrDC8IzBCuh48Ly5A056FHYufi3vyXPTVVOnunXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017460; c=relaxed/simple;
	bh=N5w9sGR83HmehQkzcyb3yU5XfW4ZSkbi04N9GlT0S40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUKehYnyES5bTUs/POlDHMmxqVNcQ0uOHgzBjsDjzsKI/51wJNh3kudXyzociQibo2TYSx7TUoNGxihevpbR5t042C6Jqso/ErvY1xInzACkU2grSZtA60Rkaz9Rq0iihuaj0lYP0fecj7yNEDuD15vpGVSdINu/F6JnegEjvs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdT9uVlZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdT9uVlZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9maUd005518
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Hr4QdaTngAzxON61S7ZU7L2
	1S4tZidHsM1IVv627kU=; b=EdT9uVlZ2cSqy652445IPY2VKG5O2/fIqWkQbY4e
	KkbBdgx0z4eg53VGih4iSDA07ocV4pP9X1t4gXzceD6ep6A24sQ2ua4FCdElIqCd
	oI5p2NmlHN/7YxonShTpC2dVeBzzUpzdNDrQc6yWaYCiL/pW/Tp7Yrc0j7iCfZVJ
	4K4r9EitS3Fr8NK8SiUrltEZX5y3wwi7eneVDgsD+lwKy7GQ4hhYLjtFDn60yenp
	Ele1bvwS+CoqjkZ5ZLp3cZPlzzkSdXkZToPNd14yzmkXf7Bnm8AFmZgMQI/rYl6Z
	xtPgJbrdl2kX31QYTXazJ0h1vnoBfcN3Esnrtf+gAaHEzA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58d8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 10:10:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b793b04fe0so60089611cf.3
        for <phone-devel@vger.kernel.org>; Tue, 16 Sep 2025 03:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017456; x=1758622256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Hr4QdaTngAzxON61S7ZU7L21S4tZidHsM1IVv627kU=;
        b=xS8z4PVuAiMDjxHzD0XJpUQ5hwbD52iKuvH9g29VgqEH0l1my50yS2gIDoLaExKx/l
         4F++Xb7JsO8O5JJguSFDdtX94BRnDrF5aVPbJrd6f2MqQrpeIJ6BBeJE3ba5cGm6PmBg
         82AbAsRp5mxn3ZKNlVpXYXmB4LidJQB8LjpnEkqjGi68i4DiK0Z3iLYkpN7UWjFIBFsq
         JkQ5eVwxUYPqqsXxJr8rf12QIkQDeZZnsZgoGmTqqK91QaYS4lc5Wb8r2y7CL0S0GKkq
         QYojhUSMhyskPlrjHKmKOvyvRkLZH9JWy6620v7zxxKN6RNyCqV6RVMfSL+YSSCGhqWT
         lRlw==
X-Forwarded-Encrypted: i=1; AJvYcCXFmlAML90vOMOMFFe0lGy1zGoZG70YjE4kLlFbNHxkBYaMWCCRnidm0NwJB9HqR7u5ksNpQpjMPu0MoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9Wy7yKxS/OvHqsP9WcBpT9hfjcTl8Olr8iCf7bu6NiX5Vaim
	TASkWnUGZHGqMIbSgBt70emwE952grRWxMw+dN+SrWbCsqlsQDKSvX+0G9H29ryOro2GHGA9B0L
	Ct3EDx4GRHryENcRsU8BiXYBbHdZkhc8m1HBNrlV3Xlgv90UXyhVtGf/75y8w7hKtCQ==
X-Gm-Gg: ASbGncsYdhmN2a9Ng6b1c9Q1vceR8RoWfK2RQ0Fpjvbu9yKqOhMtarjJB/tbCtcUgkj
	Vo+Jt+p3MXcZoXMb2twLkaJzmkvB33JWakhxEWeiVcG47fcaOGXU7BBRIKfZw/iHQqki2v12CeL
	7W+sWd/Pfi5yoL9JONQPPE4lzNyge1QkkdHWhgtznMk4fY1gwg280rghKn08kxPl76WD8jgiFv9
	/EBSRVSH3V20I5RAWzBuvo9ablyfQFdAkJyEa8vctCNxBxRVTcySCQ7nHQwd8Fl7cn/yvAntqYa
	sfm79a4DHux2kQY36zzalncxNULLYOiS5HiMUXk13uFcDWW2iQ5DqIzqHS/fjJ7aeOpTkMkUkxV
	9TWX1PUYmgBBifLkWq/XpE9hP8duFo8nn4m7BaOmEzR9sdwFfH9yp
X-Received: by 2002:ac8:59c5:0:b0:4b4:8eb7:a45e with SMTP id d75a77b69052e-4b77cfd7c3bmr187846991cf.35.1758017456280;
        Tue, 16 Sep 2025 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYmRtvb+l0jlW/S7lOSeC4zeZd7f9A/J0FIqtj2p1keSF3dZBC3idnn20IpIn9AtMWbRfH7w==
X-Received: by 2002:ac8:59c5:0:b0:4b4:8eb7:a45e with SMTP id d75a77b69052e-4b77cfd7c3bmr187846561cf.35.1758017455741;
        Tue, 16 Sep 2025 03:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5d8c4783sm4320157e87.56.2025.09.16.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:10:54 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:10:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
Message-ID: <tzdnkjnq55ea7u7wqjvn6kzaobau6blnambiass3y6wezqgshs@otgiuusykcrz>
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
 <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-sm6350-ufs-things-v1-2-3600362cc52c@fairphone.com>
X-Proofpoint-GUID: Ossh4bBZZWqLgHJKKAtAXOmMk5UxTQ_k
X-Proofpoint-ORIG-GUID: Ossh4bBZZWqLgHJKKAtAXOmMk5UxTQ_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX1EK1IDB7wvXu
 DkQ10CG2ftTYgnRKxW63Rlk9sRZqTnRFdvV8tSBN23OhHbI/D4vw5gNWQepOfzMn4KX7dcKUfdI
 IEdWOLADR+jLHf+tzLz3Fxq9UDB31ErNVV6S0tJ7ADY+itFLsGp7CXz14fCNIgLl3qUWs7/tpFA
 QZ29gvcuOQa6K0g7B2vay/zlxq9frdAJzsy6LbavNV8AlMeZreuUW41wV54CfdvZaH9gSOXjT7L
 0Qwv5ol84gxI/WaLGD0lm2oUQA/YlFWIE4HzE/LRf8b4KrjGcUAoQlGX29kGrtHLp6YRA02n11q
 IUSDtCJ/jxj7AwZhgqQJmsyohfEe28rD79b+I+uAPQdzBUukvxzt8KmMV7DCc70ow86ZACiK9JF
 AH6N7/Wp
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c937b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=m3AVSQT7pDQk2eD9g64A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Fri, Mar 14, 2025 at 10:17:03AM +0100, Luca Weiss wrote:
> UFS host controller, when scaling gears, should choose appropriate
> performance state of RPMh power domain controller along with clock
> frequency. So let's add the OPP table support to specify both clock
> frequency and RPMh performance states replacing the old "freq-table-hz"
> property.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 42 +++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
